//
//  WaterBottleView.swift
//  Design#10
//
//  Created by Hubert Le on 1/21/22.
//

import SwiftUI

struct WaterBottleView: View {
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image("water1")
                        .resizable()
                        .shadow(radius: 1, x:-5,y:5)
                        .frame(width: 175, height: 175)
                }.frame(width: 200, height: 250)
                    .background(Color(#colorLiteral(red: 0.9387472272, green: 0.9387472272, blue: 0.9387472272, alpha: 1)))
                    .offset(y:-50)
                HStack {
                    Image("water2")
                        .resizable()
                        .shadow(radius: 1, x:-5,y:5)
                        .frame(width: 125, height: 125)
                }.frame(width: 200, height: 200)
                    .background(Color(#colorLiteral(red: 0.9387472272, green: 0.9387472272, blue: 0.9387472272, alpha: 1)))
                    .offset(y: -75)
            }
            HStack {
                HStack {
                    Image("water3")
                        .resizable()
                        .shadow(radius: 1, x:-5,y:5)
                        .frame(width: 125, height: 125)
                }.frame(width: 200, height: 200)
                    .background(Color(#colorLiteral(red: 0.9387472272, green: 0.9387472272, blue: 0.9387472272, alpha: 1)))
                    .offset(y: -75)
                HStack {
                    Image("water4")
                        .resizable()
                        .shadow(radius: 1, x:-5,y:5)
                        .frame(width: 175, height: 175)
                }.frame(width: 200, height: 250)
                    .background(Color(#colorLiteral(red: 0.9387472272, green: 0.9387472272, blue: 0.9387472272, alpha: 1)))
                    .offset(y: -100)
                
            }
        }
    }
}

struct WaterBottleView_Previews: PreviewProvider {
    static var previews: some View {
        WaterBottleView()
    }
}
