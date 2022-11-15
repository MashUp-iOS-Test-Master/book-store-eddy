//
//  Entity+CoreDataProperties.swift
//  Book-Store-Eddy
//
//  Created by Kyunghun Kim on 2022/11/15.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var category: String
    @NSManaged public var name: String
    @NSManaged public var price: String
    @NSManaged public var publicationDate: String

}

extension Entity : Identifiable {

}
