//
//  HomeView.swift
//  Book-Store-Eddy
//
//  Created by Eddy on 2022/10/17.
//

import UIKit

final class HomeView: UIView {
    let tableview = UITableView()

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setTableView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setTableView() {
        tableview.register(HomeViewCell.self, forCellReuseIdentifier: HomeViewCell.identifer)
    }

    private func setLayout() {
        self.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableview.topAnchor.constraint(equalTo: self.topAnchor),
            tableview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
