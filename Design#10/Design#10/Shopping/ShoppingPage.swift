//
//  ShoppingPage.swift
//  Design#10
//
//  Created by Hubert Le on 1/21/22.
//

import SwiftUI

struct ShoppingPage: View {
    var body: some View {
        ZStack {
            BackgroundPage()
            WhiteContents()
                .offset(y:120)
        }
    }
}

struct ShoppingPage_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingPage()
    }
}

struct BackgroundPage: View {
    var body: some View {
        VStack {
            Group {
                HStack {
                    Image("menu")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                }
                HStack {
                    Text("Explore Bottles")
                        .lineLimit(2)
                        .font(.system(size:40,weight: .heavy))
                        .frame(width:150)
                        .padding(.top,50)
                    Spacer()
                }
            }.foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 50, alignment: .center)
            Color.white
                .ignoresSafeArea()
                .cornerRadius(50)
                .offset(y:30)
        }.background(.black)
    }
}
