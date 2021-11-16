//
//  MMTab.swift
//  Design#3
//
//  Created by Hubert Le on 11/16/21.
//

import SwiftUI

struct MMTab: View {
    var body: some View {
        HStack {
            Tabs(text: "Art")
            Spacer()
            Tabs(text: "Music")
            Spacer()
            Tabs(text: "Sport")
        }.frame(width: 340, height: 50, alignment: .center)
    }
}

struct MMTab_Previews: PreviewProvider {
    static var previews: some View {
        MMTab()
    }
}

struct Tabs: View {
    var text: String
    var body: some View {
        HStack {
            Text(text)
                .frame(width: 100, height: 50)
                .background(Color(#colorLiteral(red: 0.8574994206, green: 0.9277706146, blue: 0.9992104173, alpha: 1)))
                .cornerRadius(10)
        }
    }
}
