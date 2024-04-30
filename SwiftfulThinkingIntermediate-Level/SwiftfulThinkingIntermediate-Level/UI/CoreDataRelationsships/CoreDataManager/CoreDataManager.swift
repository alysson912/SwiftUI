//
//  CoreDataManager.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 30/04/24.
//

import Foundation
import CoreData

//MARK: 3 ENTIDADES
// BUSINESSENTITY
// DEPARTMENTENTITY
// EMPLOYEEENTITY

//MARK: Singleton para gerenciar core Data
class CoreDataManager {
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading CoreData. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Saved succesfully")
        } catch let error {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
}
