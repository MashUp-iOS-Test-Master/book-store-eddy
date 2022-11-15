//
//  HomeViewCell.swift
//  Book-Store-Eddy
//
//  Created by Eddy on 2022/10/16.
//

import UIKit

final class HomeViewCell: UITableViewCell {
    static var identifer: String {
        String(describing: Self.self)
    }

    private let nameLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    private let categoryLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    private let publicationDateLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    private let bookInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal

        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ book: Book) {
        nameLabel.text = book.name
        categoryLabel.text = book.category
        publicationDateLabel.text = book.publicationDate
        priceLabel.text = book.price
    }
    
    func setPrice(_ book: Book) -> String {
        book.price
    }

    private func setLayout() {
        self.contentView.addSubview(bookInfoStackView)
        bookInfoStackView.addArrangedSubviews(with: [nameLabel, categoryLabel, publicationDateLabel, priceLabel])

        NSLayoutConstraint.activate([
            bookInfoStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            bookInfoStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            bookInfoStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            bookInfoStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
}
