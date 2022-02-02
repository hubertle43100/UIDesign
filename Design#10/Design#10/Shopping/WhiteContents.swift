//
//  WhiteContents.swift
//  Design#10
//
//  Created by Hubert Le on 1/26/22.
//

import SwiftUI

struct WhiteContents: View {
    var body: some View {
        VStack {
            HStack {
                Text("New")
                Spacer()
                Text("Bestsellers")
                Spacer()
                Text("Premium")
                    .frame(width:100, height: 30)
                    .background(.black)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                Spacer()
                Text("Best Value")
                
            }
            ScrollView(.horizontal) {
                HStack {
                    BottleSelect(image: "water1", colorName: "Red Tomato", price: "$33.99")
                    BottleSelect(image: "water2", colorName: "Agua Blue", price: "$34.99")
                    BottleSelect(image: "water3", colorName: "Green Leaves", price: "$30.99")
                    BottleSelect(image: "water4", colorName: "Posionus Purple", price: "$29.99")
                }.offset(y:30)
                    .frame(height: 300)
            }
            HStack {
                Text("Bestseller")
                    .font(.system(size: 20).bold())
                Spacer()
            }
            BottleOffer()
        }.frame(width: UIScreen.main.bounds.width - 50, alignment: .center)
    }
}

struct WhiteContents_Previews: PreviewProvider {
    static var previews: some View {
        WhiteContents()
    }
}
