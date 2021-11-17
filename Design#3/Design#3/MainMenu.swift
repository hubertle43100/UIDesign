//
//  MainMenu.swift
//  Design#3
//
//  Created by Hubert Le on 11/16/21.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        VStack {
            MMHeader()
            HStack {
                Text("Best NFT For Your Galery")
                    .frame(width: 200, height: 100, alignment: .leading)
                    .font(.system(size: 30,weight: .heavy))
                .offset(x: -70, y: 0)
            }
            MMTab()
                .padding(.bottom, 20)
            MMNFT()
                .padding(.bottom,50)
            MMLower()

        }.offset(x: 0, y: -5)
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainMenu()
        }
    }
}
