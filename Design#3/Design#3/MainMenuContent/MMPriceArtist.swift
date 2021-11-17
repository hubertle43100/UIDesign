//
//  MMPriceArtist.swift
//  Design#3
//
//  Created by Hubert Le on 11/16/21.
//

import SwiftUI

struct MMPriceArtist: View {
    var body: some View {
        HStack {
            Info(title: "Author", name: "Le Hubert", pic: "person")
            Spacer()
            Info(title: "Bid", name: "5.4 ETH", pic: "person")
        }.frame(width: 350, height: 50)
    }
}

struct MMPriceArtist_Previews: PreviewProvider {
    static var previews: some View {
        MMPriceArtist()
    }
}

struct Info: View {
    var title: String
    var name: String
    var pic: String
    
    var body: some View {
        HStack {
            Image(systemName: pic)
                .font(.system(size: 25))
                .foregroundColor(Color(#colorLiteral(red: 0.1377861202, green: 0.5809728503, blue: 0.9946960807, alpha: 1)))
                .frame(width: 50, height: 50)
                .background(Color(#colorLiteral(red: 0.8398336768, green: 0.9202272892, blue: 0.9957557321, alpha: 1)))
                .cornerRadius(15)
            VStack {
                Text(title)
                    .opacity(0.5)
                    .offset(x: -23, y: 0)
                Text(name)
                    .font(.system(size: 20, weight: .heavy).bold())
            }
        }
    }
}
