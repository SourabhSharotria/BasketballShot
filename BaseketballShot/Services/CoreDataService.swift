//
//  CoreDataService.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 09/08/25.
//

import CoreData

final class CoreDataService {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BasketBallShot")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data load error: \(error)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    func saveContext() {
        if context.hasChanges {
            do { try context.save() }
            catch { fatalError("Save error: \(error)") }
        }
    }
}
