//
//  SwipeAction.swift
//  Book-Store-Eddy
//
//  Created by Kyunghun Kim on 2022/11/15.
//

import UIKit

struct SwipeAction {
    let title: String?
    let style: UIContextualAction.Style
    let image: UIImage?
    let backgroundColor: UIColor?
    let action: (() -> Void)?
}
