//
//  Date+sugar.swift
//  Book-Store-Eddy
//
//  Created by Kyunghun Kim on 2022/11/15.
//

import Foundation

extension Date {
    public enum FormatType: String {
        case full = "YYYY-MM-dd"

        var displayName: String {
            return self.rawValue
        }
    }

    func fullDateString(_ type: FormatType) -> String {
        Formatter.shared.dateFormat = type.displayName
        guard let dateString = Formatter.shared.string(for: self) else { return "" }
        return dateString
    }
}
