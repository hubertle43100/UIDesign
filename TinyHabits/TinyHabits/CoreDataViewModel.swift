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
    @Published var savedEntitiesTask: [HabitEntity] = []
    @Published var savedEntitiesProg: [HabitEntity] = []
    
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
            savedEntitiesTask = try container.viewContext.fetch(request)
            savedEntitiesProg = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addHabitTask(text: String) {
        let newHabitTask = HabitEntity(context: container.viewContext)
        newHabitTask.task = text
        saveData()
    }
    
    func addHabitProgress(nums: Float) {
        let newHabitProg = HabitEntity(context: container.viewContext)
        newHabitProg.progressValue = nums
        saveData()
    }
    
    func updateHabit(entity: HabitEntity) {
        let currentTask = entity.task ?? ""
        let newTask = currentTask + "!"
        entity.task = newTask
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else {return}
        let entity = savedEntitiesTask[index]
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

