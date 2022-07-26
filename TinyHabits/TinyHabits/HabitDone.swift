//
//  HabitDone.swift
//  TinyHabits
//
//  Created by Hubert Le on 7/25/22.
//

import SwiftUI

struct HabitDone: View {
    @StateObject var model: CoreDataViewModel
    var body: some View {
        VStack {
            Header().navigationBarBackButtonHidden(true)
            List {
                ForEach(model.savedEntitiesTask) { entity in
                    Text(entity.task ?? "No Name")
                }
            }
        }
    }
}
