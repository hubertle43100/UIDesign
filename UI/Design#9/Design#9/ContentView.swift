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
            ScrollView {
                Group {
                    MainPage()
                }.frame(width: 400)
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Friends")
                            .foregroundColor(.blue)
                }
            }
            FriendPage()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Friends")
                }
            OfferPage()
                .tabItem {
                    Image(systemName: "star")
                    Text("Offers")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
