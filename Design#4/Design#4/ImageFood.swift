//
//  ImageFood.swift
//  Design#4
//
//  Created by Hubert Le on 11/17/21.
//

import SwiftUI

struct ImageFood: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                FoodView(FoodPic: "hot-pot", FoodName: "Hot Pot", FoodDescription: "Get Free Green Tea with hotpot",colorBackground: Color.green)
                FoodView(FoodPic: "fast-food", FoodName: "McDonald's", FoodDescription: "BOGO anything on $1 menu",colorBackground: Color.blue)
                FoodView(FoodPic: "dish", FoodName: "Sizzler", FoodDescription: "12% off for any steak ordered",colorBackground: Color.red)
            }
        }.padding(.leading)
    }
}

struct ImageFood_Previews: PreviewProvider {
    static var previews: some View {
        ImageFood()
    }
}

struct FoodView: View {
    var FoodPic: String
    var FoodName: String
    var FoodDescription: String
    var colorBackground: Color
    
    var body: some View {
        VStack {
            VStack {
                Image(FoodPic)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(15)
            }.frame(width: 250, height: 250)
                .background(colorBackground)
                .cornerRadius(20)
                .padding(.bottom)
            HStack {
                Text(FoodName)
                    .font(.system(size: 25).bold())
                Spacer()
            }.frame(width: 240, height: 20)
            HStack {
                Text(FoodDescription)
                    .foregroundColor(Color.gray)
                Spacer()
            }.frame(width: 240, height:50)
                .lineLimit(2)
        }
    }
}
