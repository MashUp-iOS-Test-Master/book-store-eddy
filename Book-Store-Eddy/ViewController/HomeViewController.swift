//
//  HomeViewController.swift
//  Book-Store-Eddy
//
//  Created by Eddy on 2022/10/14.
//

import UIKit

final class HomeViewController: UIViewController {
    private let homeView = HomeView()
    private let dataManager = PersistentManager()

    override func loadView() {
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        self.navigationItem.rightBarButtonItem = rightButton
    }

    private func setTableView() {
        homeView.tableview.delegate = self
        homeView.tableview.dataSource = self
    }

    private lazy var rightButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonDidTapped))

        return button
    }()

    @objc private func buttonDidTapped() {
        let registerViewController = RegisterViewController()
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.identifer) as? HomeViewCell else {
            return UITableViewCell()

        }
        let test = Book(name: "ㅎㅇ", category: "하이", publicationDate: "11", price: 123)
//        let books = dataManager.fetch()
        cell.configure(test)

        return cell
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "hello"
    }
}
