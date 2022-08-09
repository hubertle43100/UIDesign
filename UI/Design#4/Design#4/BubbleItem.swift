//
//  BubbleItem.swift
//  Design#4
//
//  Created by Hubert Le on 11/17/21.
//

import SwiftUI

struct BubbleItem: View {
    var body: some View {
        VStack {
            HStack {
                Options(imageName: "search", TextDescription: "Search")
                Spacer()
                Options(imageName: "pizza", TextDescription: "Dining")
                Spacer()
                Options(imageName: "parking", TextDescription: "Park")
                Spacer()
                Options(imageName: "online-shopping", TextDescription: "Shop")
            }.frame(width: 380, height: 100)
                .padding(.bottom,20)
            HStack {
                Options(imageName: "compass", TextDescription: "Map")
                Spacer()
                Options(imageName: "price-tag", TextDescription: "Sales")
                Spacer()
                Options(imageName: "groceries", TextDescription: "Groceries")
                Spacer()
                Options(imageName: "ticket", TextDescription: "Tickets")
            }.frame(width: 380, height: 100)
        }
    }
}

struct BubbleItem_Previews: PreviewProvider {
    static var previews: some View {
        BubbleItem()
    }
}

struct Options: View {
    var imageName: String
    var TextDescription: String
    var body: some View {
        VStack {
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 30, height: 30)
            } .frame(width: 80, height: 80)
                .background(Color(#colorLiteral(red: 0.9417380691, green: 0.9552586675, blue: 0.9704266191, alpha: 1)))
                .cornerRadius(100)
            Text(TextDescription)
        }
    }
}
