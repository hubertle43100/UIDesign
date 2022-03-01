//
//  MainView.swift
//  DesignPlus#2
//
//  Created by Hubert Le on 2/28/22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    var body: some View {
        TabView {
            MenuPage()
                .tabItem {
                    Label("Menu", systemImage: "menubar.rectangle")
                }
            ProfilePage()
                .tabItem {
                    Label("profile", systemImage: "menubar.rectangle")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
