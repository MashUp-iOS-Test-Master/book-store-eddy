//
//  Storage.swift
//  Book-Store-Eddy
//
//  Created by Eddy on 2022/10/15.
//

import Foundation

protocol Storage {
    func fetch() -> [Book] 
    func save(book: Book)
    func delete(book: BookEntity, index: Int?)
}
