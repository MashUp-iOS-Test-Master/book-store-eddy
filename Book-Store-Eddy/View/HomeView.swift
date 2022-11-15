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
    
    private let totalPriceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemMint
        
        return view
    }()
    
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func setTotalPrice(totalPrice: String) {
        totalPriceLabel.text = totalPrice
    }
    
    private func setLayout() {
        self.addSubview(tableview)
        self.addSubview(totalPriceView)
        totalPriceView.addSubview(totalPriceLabel)
        
        tableview.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableview.topAnchor.constraint(equalTo: self.topAnchor),
            tableview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: totalPriceView.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            totalPriceLabel.centerXAnchor.constraint(equalTo: totalPriceView.centerXAnchor),
            totalPriceLabel.centerYAnchor.constraint(equalTo: totalPriceView.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            totalPriceView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            totalPriceView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            totalPriceView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            totalPriceView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
