//
//  Formatter.swift
//  Book-Store-Eddy
//
//  Created by Kyunghun Kim on 2022/11/15.
//

import Foundation

struct Formatter {
    static let shared: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")

        return dateFormatter
    }()

    private init() {}
}
