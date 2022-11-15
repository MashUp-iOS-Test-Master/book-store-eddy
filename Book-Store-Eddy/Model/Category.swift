//
//  Category.swift
//  Book-Store-Eddy
//
//  Created by Kyunghun Kim on 2022/11/15.
//

import Foundation

enum Category: CaseIterable {
    case novel
    case technic
    case economy
    case poem
    
    var title: String {
        switch self {
        case .novel:
            return "소설"
        case .technic:
            return "기술"
        case .economy:
            return "경제"
        case .poem:
            return "시집"
        }
    }
}
