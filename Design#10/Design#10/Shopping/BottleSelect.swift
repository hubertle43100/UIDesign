//
//  BottleSelect.swift
//  Design#10
//
//  Created by Hubert Le on 1/26/22.
//

import SwiftUI

struct BottleSelect: View {
    var body: some View {
        VStack {
            Image("water1")
                .resizable()
                .frame(width: 150, height: 150)
            Text("Bottle with red")
                .font(.system(size: 18))
                .frame(width: 110, height: 50)
            HStack {
                Group {
                    Text("$33")
                        .font(.system(size: 28))
                    Text(".99")
                }.font(.system(size: 28))
            }
        }
    }
}

struct BottleSelect_Previews: PreviewProvider {
    static var previews: some View {
        BottleSelect()
    }
}
