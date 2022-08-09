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
            HStack {
                Text("Offers")
                    .font(.system(size: 35).bold())
                    .offset(y:20)
                Spacer()
            }
            Divider()
            Image("coffeesorry")
                .resizable()
                .frame(width: 400, height: 300)
                .cornerRadius(10)
                .padding()
            Text("You don't have any active offers right now. Check back soon to explore personalized offers, coupons and games.")
                .font(.system(size: 20))
            Spacer()
        }.frame(width: 400)
    }
}

struct OfferPage_Previews: PreviewProvider {
    static var previews: some View {
        OfferPage()
    }
}
