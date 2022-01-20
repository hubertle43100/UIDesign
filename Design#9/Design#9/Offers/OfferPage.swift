//
//  OfferPage.swift
//  Design#9
//
//  Created by Hubert Le on 1/19/22.
//

import SwiftUI

struct OfferPage: View {
    var body: some View {
        VStack {
            Text("Offers")
            Image("coffeesorry")
                .resizable()
            .frame(width: 400, height: 300)
        }
    }
}

struct OfferPage_Previews: PreviewProvider {
    static var previews: some View {
        OfferPage()
    }
}
