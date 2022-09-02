//
//  ContentView.swift
//  TinyHabits
//
//  Created by Hubert Le on 7/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = CoreDataViewModel()
    
    var body: some View {
        TabView {
            HabitMain(model: vm)
                .tabItem {
                    VStack {
                        Text("Habits")
                        Image(systemName: "pencil.circle.fill")
                            .renderingMode(.template)
                    }
                    
                }
            
            SettingMain()
                .tabItem {
                    VStack {
                        Text("Setting")
                        Image(systemName: "line.horizontal.3.decrease.circle.fill")
                            .renderingMode(.template)
                    }
                }
        }.accentColor(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



