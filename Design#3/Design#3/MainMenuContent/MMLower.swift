//
//  MMLower.swift
//  Design#3
//
//  Created by Hubert Le on 11/16/21.
//

import SwiftUI

struct MMLower: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .font(.system(size: 25))
            Spacer()
            Image(systemName: "person")
                .font(.system(size: 25))
            Spacer()
            Image(systemName: "person")
                .font(.system(size: 25))
            Spacer()
            Image(systemName: "person")
                .font(.system(size: 25))
        }.frame(width: 300, height: 30)
    }
}

struct MMLower_Previews: PreviewProvider {
    static var previews: some View {
        MMLower()
    }
}
