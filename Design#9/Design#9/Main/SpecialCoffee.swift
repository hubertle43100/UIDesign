//
//  SpecialCoffee.swift
//  Design#9
//
//  Created by Hubert Le on 1/17/22.
//

import SwiftUI

struct SpecialCoffee: View {
    var body: some View {
        HStack {
            Image("matcha")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .cornerRadius(20)
                .padding(.trailing,5)
            VStack {
                HStack {
                    Text("Matcha")
                        .frame(width: 100, height: 30)
                        .background(Color(#colorLiteral(red: 0.7868378162, green: 0.6098696589, blue: 0.3898667693, alpha: 1)))
                        .cornerRadius(30)
                    .foregroundColor(.white)
                    Spacer()
                }
                HStack {
                    Text("Americans love a cup of tea, but we don't always know how to make it a part of a healthy lifestyle.")
                        .font(.system(size: 15).bold())
                        .foregroundColor(Color(#colorLiteral(red: 0.07884628326, green: 0.2984878421, blue: 0.1641706824, alpha: 1)))
                    Spacer()
                }
            }
        }.frame(width: 400)
    }
}

struct SpecialCoffee_Previews: PreviewProvider {
    static var previews: some View {
        SpecialCoffee()
    }
}
