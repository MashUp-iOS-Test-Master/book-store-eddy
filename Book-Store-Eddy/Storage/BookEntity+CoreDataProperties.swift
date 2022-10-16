//
//  BookEntity+CoreDataProperties.swift
//  Book-Store-Eddy
//
//  Created by Eddy on 2022/10/15.
//
//

import Foundation
import CoreData


extension BookEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookEntity> {
        return NSFetchRequest<BookEntity>(entityName: "BookEntity")
    }

    @NSManaged public var name: String
    @NSManaged public var category: String
    @NSManaged public var publicationDate: String
    @NSManaged public var price: Int16
}

extension BookEntity : Identifiable {

}
