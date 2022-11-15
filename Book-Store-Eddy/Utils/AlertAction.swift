//
//  AlertAction.swift
//  Book-Store-Eddy
//
//  Created by Eddy on 2022/10/24.
//

import UIKit

struct AlertAction {
    let title: String
    let style: UIAlertAction.Style
    let completion: (() -> Void)?
}
