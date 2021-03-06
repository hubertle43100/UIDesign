//
//  ContentView.swift
//  TinyHabits
//
//  Created by Hubert Le on 7/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HabitMain()
                .tabItem {
                    Label("Habits", systemImage: "pencil.circle.fill")
                }

            Text("Tab 2")
                .tabItem {
                    Label("Settings", systemImage: "line.horizontal.3.decrease.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
