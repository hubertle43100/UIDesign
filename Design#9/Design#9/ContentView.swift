//
//  ContentView.swift
//  Design#9
//
//  Created by Hubert Le on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Group {
                MainPage()
            }.frame(width: 400)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favourites")
                }
            FriendPage()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Friends")
                }
            Text("Nearby Screen")
                .tabItem {
                    Image(systemName: "mappin.circle.fill")
                    Text("Nearby")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
