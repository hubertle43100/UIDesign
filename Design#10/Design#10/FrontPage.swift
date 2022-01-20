//
//  FrontPage.swift
//  Design#10
//
//  Created by Hubert Le on 1/20/22.
//

import SwiftUI

struct FrontPage: View {
    var body: some View {
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
                Text("CLOSCA WATER BOTTLE")
                    .font(.system(size: 35,weight: .heavy))
                Spacer()
            }.padding()
            HStack {
                Image("water1")
                    .resizable()
                    .shadow(radius: 1, x:-5,y:5)
                .frame(width: 200, height: 200)
            }.frame(width: 200, height: 300)
                .background(Color(#colorLiteral(red: 0.9387472272, green: 0.9387472272, blue: 0.9387472272, alpha: 1)))
        }.frame(width: UIScreen.main.bounds.width - 50, alignment: .center)
    }
}

struct FrontPage_Previews: PreviewProvider {
    static var previews: some View {
        FrontPage()
    }
}
