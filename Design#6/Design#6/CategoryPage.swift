//
//  CategoryPage.swift
//  Design#6
//
//  Created by Hubert Le on 12/1/21.
//

import SwiftUI

struct CategoryPage: View {
    @SwiftUI.Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        TabView {
            CategoryMain()
                .tabItem {
                    Image(systemName: "house")
                    Text("home")
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

struct CategoryPage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPage()
    }
}

struct Header: View {
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        HStack {
            VStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.backward")
                        .font(.system(size: 25))
                        .foregroundColor(Color.black)
                }
            }.navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .padding(.trailing,115)
            Text("Option")
                .font(.system(size: 20).bold())
            Spacer()
            Image(systemName: "menubar.dock.rectangle")
        }.frame(width:370)
            .padding(.bottom)
    }
}

struct CategoryMain: View {
    var body: some View {
        VStack {
            Header()
            CategoryBoxes()
        }
    }
}
