//
//  HeaderSection.swift
//  Design#1
//
//  Created by Hubert Le on 11/9/21.
//

import SwiftUI

struct HeaderSection: View {
    var body: some View {
        HStack {
            ShippingLine()
            VStack(alignment: .leading){
                Text("Disneyland Park                           Anaheim CA")
                    .bold()
                    .offset(y: -25)
                Text("Nov 20th")
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .font(.system(size: 17, weight: .medium,design: .default))
                    .offset(y: -20)
                VStack(alignment: .leading){
                    Text("Disney California Adventure Park Anaheim CA")
                        .bold()
                        .offset(y: 93)
                    Text("Nov 21th")
                        .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        .font(.system(size: 17, weight: .medium,design: .default))
                        .offset(y: 98)
                }
            }
            .padding(.leading, 5)
            Spacer()
        }.padding(.horizontal, 30)
    }
}

struct HeaderSection_Previews: PreviewProvider {
    static var previews: some View {
        HeaderSection()
    }
}

struct ShippingLine: View {
    var body: some View {
        VStack {
            Circle()
                .frame(width: 8, height: 8)
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            Circle()
                .frame(width: 8, height: 8)
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            Circle()
                .frame(width: 8, height: 8)
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            Circle()
                .frame(width: 8, height: 8)
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            ZStack{
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                Circle()
                    .frame(width: 14, height: 14)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            }
            VStack {
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                ZStack{
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(#colorLiteral(red: 0.7171135545, green: 0.8954340219, blue: 0.9694123864, alpha: 1)))
                    Image(systemName: "flag.fill")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                }
            }
        }
    }
}
