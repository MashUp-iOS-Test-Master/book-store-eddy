//
//  PersistentManager.swift
//  Book-Store-Eddy
//
//  Created by Eddy on 2022/10/15.
//

import CoreData
import Foundation

final class PersistentManager: Storage {
    static let shared = PersistentManager()
    private(set) var books = [Book]()

    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BookStore")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unable to load \(error)")
            }
        }

        return container
    }()

    private var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    init() {
        let request = Entity.fetchRequest()
        let sort = NSSortDescriptor(key: "name", ascending: false)
        request.sortDescriptors = [sort]
        guard let bookData = try? mainContext.fetch(request) else { return }
        let bookEntites = bookData.map { bookEntity in
            Book(name: bookEntity.name, category: bookEntity.category, publicationDate: bookEntity.publicationDate, price: bookEntity.price)
        }

        books += bookEntites
    }

    private func saveContext() {
        guard mainContext.hasChanges else {
            return
        }

        do {
            try mainContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    func fetch() -> [Book]{
        return books
    }

    func save(book: Book) {
        let book = Book(name: book.name, category: book.category, publicationDate: book.publicationDate, price: book.price)

        books.append(book)

        let entity = Entity(context: mainContext)
        entity.name = book.name
        entity.category = book.category
        entity.publicationDate = book.publicationDate
        entity.price = book.price
        saveContext()
    }

    func delete(book: Entity, index: Int?) {
        if let index = index {
            books.remove(at: index)
        }

        mainContext.delete(book)
        saveContext()
    }
}
