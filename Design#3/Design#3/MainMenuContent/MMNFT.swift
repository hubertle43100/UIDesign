//
//  MMNFT.swift
//  Design#3
//
//  Created by Hubert Le on 11/16/21.
//

import SwiftUI

struct MMNFT: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    MMTime()
                }.frame(width: 330, height: 40, alignment: .trailing)
                    .offset(x: 0, y: -15)
                Image("uranus")
                    .resizable()
                .frame(width: 200, height: 200)
                VStack {
                    HStack {
                        Text("Planet")
                            .font(.system(size: 20,weight: .heavy))
                        Spacer()
                    }.frame(width: 350, height: 20)
                    MMPriceArtist()
                }.frame(width: 370, height: 135)
                    .background(Color.white)
                    .offset(x: 0, y: 30)
            }.frame(width: 370, height: 450)
                .background(Color.gray)
                .cornerRadius(30)
                .shadow(color: Color(#colorLiteral(red: 0.7301312089, green: 0.8668928742, blue: 0.9966827035, alpha: 1)), radius: 2, x: 5, y: 5)
        }
    }
}

struct MMNFT_Previews: PreviewProvider {
    static var previews: some View {
        MMNFT()
    }
}
