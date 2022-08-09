//
//  AddBasket.swift
//  Design#2
//
//  Created by Hubert Le on 11/15/21.
//

import SwiftUI

struct AddBasket: View {
    var body: some View {
        HStack {
            Text("ADD TO BASKET")
                .font(.system(size: 19).bold())
                .tracking(3)
                .foregroundColor(.white)
                .frame(width: 350, height: 70, alignment: .center)
                .background(Color(.black))
                .cornerRadius(100)
        }
    }
}

struct AddBasket_Previews: PreviewProvider {
    static var previews: some View {
        AddBasket()
    }
}
