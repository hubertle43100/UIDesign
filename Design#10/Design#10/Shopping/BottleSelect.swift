//
//  BottleSelect.swift
//  Design#10
//
//  Created by Hubert Le on 1/26/22.
//

import SwiftUI

struct BottleSelect: View {
    var image: String
    var colorName: String
    var price: String
    
    var body: some View {
        VStack {
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: 150, height: 150)
                Text(colorName)
                    .font(.system(size: 20))
                HStack {
                    Text(price)
                        .font(.system(size: 28).bold())
                }
            }.frame(width: 150, height: 150)
                .offset(y:-40)
                .background(Color(#colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)))
        }
    }
}

struct BottleSelect_Previews: PreviewProvider {
    static var previews: some View {
        BottleSelect(image: "water1", colorName: "Red Tomato", price: "$33.99")
    }
}
