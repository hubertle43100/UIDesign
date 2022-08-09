//
//  MainMenu.swift
//  Design#3
//
//  Created by Hubert Le on 11/16/21.
//

import SwiftUI

struct MainMenu: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            MMHeader()
                        }
                    }
                    .navigationBarTitle("")
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
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

        }
    }


struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainMenu()
        }
    }
}
