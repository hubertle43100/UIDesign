//
//  ContentView.swift
//  Design#3
//
//  Created by Hubert Le on 11/16/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("uranus")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .offset(x: 0, y: -100)
                    .padding(.top, 100)
                Text("Search Best NFT With Us")
                    .frame(width: 250, height: 90, alignment: .center)
                    .font(.system(size: 35).bold())
                Text("The best platform to buy and sell NFT quickly and easily")
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 100, alignment: .center)
                    .font(.system(size: 15))
                    .opacity(0.4)
                
                if #available(iOS 15.0, *) {
                    NavigationLink(destination: MainMenu()) {
                        Text("Do Something")
                            .foregroundColor(.white)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }.frame(width: 250, height: 70)
                        .background(Color(#colorLiteral(red: 0.09187077731, green: 0.5613237023, blue: 0.9913905263, alpha: 1)))
                        .cornerRadius(100)
                        .shadow(color: Color(#colorLiteral(red: 0.8702427745, green: 0.9354624748, blue: 0.9984554648, alpha: 1)), radius: 3, x: 10, y: 10)
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
