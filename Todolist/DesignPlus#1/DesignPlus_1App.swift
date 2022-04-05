//
//  DesignPlus_1App.swift
//  DesignPlus#1
//
//  Created by Hubert Le on 2/10/22.
//

import SwiftUI

@main
struct DesignPlus_1App: App {
    //2. inject view content
    let persistentContainer = CoreDataManager.shared.persistentContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
