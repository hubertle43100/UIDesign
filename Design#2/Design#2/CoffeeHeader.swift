//
//  CoffeeHeader.swift
//  Design#2
//
//  Created by Hubert Le on 11/12/21.
//

import SwiftUI

struct CoffeeHeader: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("The Best Coffee For You")
                        .font(.system(size: 19, weight: .heavy, design: .default))
                        .foregroundColor(Color(#colorLiteral(red: 0.8734618425, green: 0.7187722325, blue: 0.431946516, alpha: 1)))
                        .lineSpacing(10)
                    .frame(width: 100)
                    .position(x: 90, y: 70)
                    Image("coffee-cup")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .position(x: 70, y: 70)
                }
            }.frame(width: 340, height: 140, alignment: .center)
                .background(Color(#colorLiteral(red: 0.9753630757, green: 0.9468169808, blue: 0.8225042224, alpha: 1)))
                .cornerRadius(25)
        }
    }
}

struct CoffeeHeader_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeHeader()
    }
}
