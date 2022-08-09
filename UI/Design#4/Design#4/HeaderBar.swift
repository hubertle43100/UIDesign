//
//  HeaderBar.swift
//  Design#4
//
//  Created by Hubert Le on 11/17/21.
//

import SwiftUI

struct HeaderBar: View {
    var body: some View {
        HStack {
            CircleDesign(pic: "bolt.fill")
            Text("1.61%")
            Text("I")
                .opacity(0.4)
            CoinBalance()
            Text("88,927")
                .offset(x: -3, y: 0)
            Text("($83.93)")
                .opacity(0.4)
                .offset(x: -10, y: 0)
            Text("I")
                .opacity(0.4)
                .offset(x: -10, y: 0)
            Image("usa")
                .resizable()
                .frame(width: 22, height: 22)
            Image("down-arrow")
                .resizable()
                .frame(width: 22, height: 22)
            
            
        }.frame(width: 335, height: 30)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color(#colorLiteral(red: 0.9287481904, green: 0.9282044768, blue: 0.9356459975, alpha: 1)), radius: 2, x: 5, y: 5)
    }
}

struct HeaderBar_Previews: PreviewProvider {
    static var previews: some View {
        HeaderBar()
    }
}

struct CircleDesign: View {
    var pic: String
    var body: some View {
        HStack {
            Image(systemName: pic)
                .font(.system(size: 12))
                .foregroundColor(Color.white)
        }.frame(width: 20, height: 20)
            .background(Color.blue)
            .cornerRadius(100)
    }
}

struct CoinBalance: View {
    var body: some View {
        HStack {
            Image("coin")
                .resizable()
                .foregroundColor(Color.white)
        }.frame(width: 22, height: 22)
            .background(Color.blue)
            .cornerRadius(100)
    }
}
