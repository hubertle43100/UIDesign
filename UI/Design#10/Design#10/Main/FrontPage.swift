//
//  FrontPage.swift
//  Design#10
//
//  Created by Hubert Le on 1/20/22.
//

import SwiftUI

struct FrontPage: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("BOLDT")
                        .font(.system(size: 25,weight: .heavy))
                    Spacer()
                    Image(systemName: "bag")
                        .frame(width: 50, height: 50)
                        .background(.black)
                        .foregroundColor(.white)
                }
                HStack {
                    Text("CLOSCA BOTTLE")
                        .font(.system(size: 35,weight: .heavy))
                        .lineLimit(2)
                    Spacer()
                }.padding()
                WaterBottleView()
                    .offset(y:65)
                NavigationLink(destination: ShoppingPage()) {
                    HStack {
                        Text("Press Me")
                            .foregroundColor(.white)
                            .frame(width: 325, height: 75)
                            .background(.black)
                        Spacer()
                        VStack {
                            Image("rightarrow")
                                .resizable()
                                .frame(width: 20, height: 30)
                        }.frame(width: 75, height: 75)
                            .background(Color(#colorLiteral(red: 0.9387472272, green: 0.9387472272, blue: 0.9387472272, alpha: 1)))
                    }
                }
                Spacer()
            }.frame(width: UIScreen.main.bounds.width - 50, alignment: .center)
        }
    }
}

struct FrontPage_Previews: PreviewProvider {
    static var previews: some View {
        FrontPage()
    }
}

