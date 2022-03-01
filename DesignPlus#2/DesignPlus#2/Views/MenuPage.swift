//
//  MenuPage.swift
//  DesignPlus#2
//
//  Created by Hubert Le on 2/28/22.
//

import SwiftUI

struct MenuPage: View {
    let date = Date()
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Circle()
                        .frame(width: 20, height: 20)
                    Text("Bulletin News")
                    Spacer()
                    
                }.padding(.bottom, 20)
                HStack {
                    Text(date, style: .date)
                    Spacer()
                }
                HStack {
                    Text("Welcome back,\nJeniffer")
                        .font(.system(size: 40).bold())
                    Spacer()
                }
            }.padding()
        }
    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage()
    }
}
