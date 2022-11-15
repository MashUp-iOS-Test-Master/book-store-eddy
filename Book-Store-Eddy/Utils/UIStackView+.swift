//
//  UIStackView+.swift
//  Book-Store-Eddy
//
//  Created by Eddy on 2022/10/16.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(with views: [UIView]) {
        views.forEach {
            addArrangedSubview($0)
        }
    }
}
