//
//  CoreDataManager.swift
//  DesignPlus#1
//
//  Created by Hubert Le on 2/10/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager() //++ create Manager only through shared and creates one instance
    
    private init() { //++ makes sure to create only one instance
        
        //1. initialize persistent container
        persistentContainer = NSPersistentContainer(name: "TodoData")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initializa CoreData \(error)")
            }
        }
    }
}
