//
//  HomeViewController.swift
//  Book-Store-Eddy
//
//  Created by Eddy on 2022/10/14.
//

import AVFoundation
import UIKit

final class HomeViewController: UIViewController {
    private let homeView = HomeView()
    private let dataManager = PersistentManager()
    
    var books: [Book] = [] {
        didSet {
            // price 업데이트
        }
    }

    override func loadView() {
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        books = dataManager.fetch()
        setIndicatorView()
        indicatorView.startAnimating()
        // 클릭 해야만 화면이 나온다? 왜지...
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.indicatorView.stopAnimating()
            self?.setTableView()
        }
        
        self.navigationItem.rightBarButtonItem = rightButton
    }

    private func setTableView() {
        homeView.tableview.delegate = self
        homeView.tableview.dataSource = self
    }
    
    private let indicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        return activityIndicator
    }()
    
    private func setIndicatorView() {
        self.view.addSubview(indicatorView)
        
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
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
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.identifer) as? HomeViewCell else { return UITableViewCell() }

        var totalPrice = 0
        
        books.forEach { book in
            totalPrice += Int(book.price) ?? 0
        }
        
        cell.configure(books[indexPath.row])
        homeView.setTotalPrice(totalPrice: String(totalPrice))

        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeBuilder = SwipeBuilder()
        
        // 코어데이터 delete도 불러야함
        return swipeBuilder.addAction(title: "삭제", style: .destructive) { [weak self] in
//            let book = dataManager.books[indexPath.row]
//            dataManager.delete(book: <#T##Entity#>, index: indexPath.row)
            tableView.reloadData()
        }.show()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = Category(rawValue: indexPath.row)
        switch category {
        case .novel:
            AudioServicesPlaySystemSound(1254)
        case .technic:
            self.view.backgroundColor = .systemRed
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.view.backgroundColor = .white
            }
        case .economy:
            break
        case .poem:
            AlertBuilder(target: self).addAction("으악", style: .default)
                .show(style: .alert)
        case .none:
            break
        }
    }
}
