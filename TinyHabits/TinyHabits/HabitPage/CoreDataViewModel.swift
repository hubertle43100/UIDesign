//
//  CoreDataViewModel.swift
//  TinyHabits
//
//  Created by Hubert Le on 7/26/22.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [HabitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "Habit")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        fetchHabit()
    }
    func fetchHabit() {
        let request = NSFetchRequest<HabitEntity>(entityName: "HabitEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addHabit(text: String, nums: Float) {
        let newHabit = HabitEntity(context: container.viewContext)
        newHabit.task = text
        newHabit.progressValue = nums
        saveData()
    }
    
    func updateHabit(entity: HabitEntity) {
        let currentTask = entity.task ?? ""
        let newTask = currentTask + "!"
        entity.task = newTask
        saveData()
    }
    
    func deleteHabit(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func quickDeleteHabit() {
        let entity = savedEntities[0]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchHabit()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
}

