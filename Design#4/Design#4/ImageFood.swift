//
//  ImageFood.swift
//  Design#4
//
//  Created by Hubert Le on 11/17/21.
//

import SwiftUI

struct ImageFood: View {
    var body: some View {
        HStack {
            VStack {
                Image("Spaget")
                    .resizable()
                    .frame(width: 200, height: 200)
                .cornerRadius(15)
                Text("")
            }
        }
    }
}

struct ImageFood_Previews: PreviewProvider {
    static var previews: some View {
        ImageFood()
    }
}
