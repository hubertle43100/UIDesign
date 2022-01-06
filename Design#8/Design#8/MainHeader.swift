//
//  MainHeader.swift
//  Design#8
//
//  Created by Hubert Le on 1/5/22.
//

import SwiftUI

struct MainHeader: View {
    var body: some View {
        HStack {
            Image("fornite")
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            VStack {
                Text("Charles")
                    .font(.system(size: 16,weight: .heavy))
                Text("Lv 5")
                    .font(.system(size: 14))
                    .frame(width: 50, height: 20)
                    .background(.blue)
                    .cornerRadius(30)
                    .foregroundColor(.white)
                    .offset(x:-5, y: -10)
            }
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "bell")
                Spacer()
                Text("|")
                Spacer()
                Image(systemName: "star")
                Spacer()
            }.frame(width: 100, height: 45)

                .cornerRadius(30)
                .shadow(radius: 2, y:2)
            
            ZStack {
                Image(systemName: "square.grid.2x2")
                
            }.frame(width: 50, height: 50)
        }.frame(width: 400)
    }
}

struct MainHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainHeader()
    }
}
