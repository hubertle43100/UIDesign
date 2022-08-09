//
//  CompanyBrand.swift
//  Design#4
//
//  Created by Hubert Le on 11/17/21.
//

import SwiftUI

struct CompanyBrand: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                VStack {
                    CompanyContent(companyName: "Walmart", imageName: "walmart", description: "25% Discount for your first purchase", coinValue: 25)
                    
                }.frame(width: 400, height: 200)
                    .background(Color.blue)
                .cornerRadius(20)
                VStack {
                    CompanyContent(companyName: "Target", imageName: "bullseye", description: "10% For purchases over $50", coinValue: 35)
                    
                }.frame(width: 400, height: 200)
                    .background(Color.red)
                .cornerRadius(20)
            }
        }.padding(.leading)
    }
}

struct CompanyBrand_Previews: PreviewProvider {
    static var previews: some View {
        CompanyBrand()
    }
}

struct CompanyContent: View {
    var companyName: String
    var imageName: String
    var description: String
    var coinValue: Int
    
    var body: some View {
        HStack {
            VStack{
                HStack {
                    Text(companyName)
                        .foregroundColor(Color.white)
                        .font(.system(size: 18).bold())
                    Image(imageName)
                        .resizable()
                        .frame(width: 20, height: 20)
                    Spacer()
                }.frame(width: 190, height: 30)
                HStack {
                    Text(description)
                        .font(.system(size: 18).bold())
                        .foregroundColor(Color.white)
                        .lineLimit(2)
                    Spacer()
                }.frame(width: 190, height: 50)
                HStack {
                    HStack {
                        Image("coin")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("+\(coinValue)")
                    }.frame(width: 100, height: 50)
                        .background(Color.white)
                        .cornerRadius(100)
                        .shadow(color: Color(#colorLiteral(red: 0.1880000234, green: 0.3611983061, blue: 0.6574720144, alpha: 1)), radius: 2, x: 2, y: 2)
                    Spacer()
                }.frame(width: 195, height: 50)
            }
            Image(imageName)
                .resizable()
                .frame(width: 140, height: 150)
                .offset(x: 60, y: 55)
        }
    }
}
