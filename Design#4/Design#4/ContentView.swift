//
//  ContentView.swift
//  Design#4
//
//  Created by Hubert Le on 11/17/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
                MainMenu()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                }
                Text("Scan/Pay")
                    .tabItem {
                        Image(systemName: "camera.viewfinder")
                        Text("Scan/Pay")
                }
                Text("Cart")
                    .tabItem {
                        Image(systemName: "cart")
                        Text("Cart")
                }
                Text("Account")
                    .tabItem {
                        Image(systemName: "person")
                        Text("Account")
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GiftHeader: View {
    var body: some View {
        HStack{
            Text("Gift Card Deals")
                .font(.system(size: 20).bold())
            Spacer()
            Text("See All")
                .foregroundColor(Color.red)
        }.frame(width: 390, height: 20)
    }
}

struct MainMenu: View {
    var body: some View {
        ScrollView {
            VStack {
                Header()
                    .padding(.bottom)
                    .padding(.top)
                BubbleItem()
                    .padding(.bottom,30)
                CompanyBrand()
                    .padding(.bottom,40)
                GiftHeader()
                    .padding(.bottom)
                ImageFood()
                
            }
        }
    }
}
