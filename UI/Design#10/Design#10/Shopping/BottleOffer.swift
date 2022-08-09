//
//  BottleOffer.swift
//  Design#10
//
//  Created by Hubert Le on 1/28/22.
//

import SwiftUI

struct BottleOffer: View {
    var body: some View {
        HStack {
            ZStack {
                Image("water1")
                    .resizable()
                .frame(width: 100, height: 100)
                Image("water2")
                    .resizable()
                .frame(width: 100, height: 100)
                .offset(x:30,y:10)
            }
            VStack {
                Text("Save up $10 with a purchase of 2 bottles")
                    .lineLimit(2)
                    .frame(width: 200, height: 50)
                    .font(.system(size: 20))
                HStack {
                    Text("$59.99")
                        .font(.system(size: 25,weight: .heavy))
                }
            }
            Spacer()
            Image("next")
                .resizable()
                .frame(width: 50, height: 50)
        }.offset(x:-13)
        .frame(width: UIScreen.main.bounds.width - 50,height:150, alignment: .center)
            .background(Color(#colorLiteral(red: 0.9490000606, green: 0.9490000606, blue: 0.9490000606, alpha: 1)))
            .cornerRadius(20)
    }
}

struct BottleOffer_Previews: PreviewProvider {
    static var previews: some View {
        BottleOffer()
    }
}
