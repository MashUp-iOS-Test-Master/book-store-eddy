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

//    override func loadView() {
//        self.view = homeView
//        self.view.backgroundColor = .blue
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.tableview.delegate = self
        setLayout()
    }

    private func setLayout() {
        self.view.addSubview(homeView)
        homeView.backgroundColor = .white
        homeView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            homeView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            homeView.topAnchor.constraint(equalTo: self.view.topAnchor),
            homeView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.identifer) as? HomeViewCell else { return UITableViewCell() }
        let test = Book(name: "ㅎㅇ", category: "하이", publicationDate: "11", price: 123)
        let books = dataManager.fetch()
        cell.configure(test)

        return cell
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "hello"
    }
}
