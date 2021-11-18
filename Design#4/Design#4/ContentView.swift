//
//  ContentView.swift
//  Design#4
//
//  Created by Hubert Le on 11/17/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Header()
                .padding(.bottom)
            BubbleItem()
                .padding(.bottom,30)
            CompanyBrand()
            GiftHeader()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GiftHeader: View {
    var body: some View {
        HStack{
            Text("Gift Card Deals")
                .font(.system(size: 20).bold())
            Spacer()
            Text("See All")
                .foregroundColor(Color.red)
        }.frame(width: 390, height: 20)
    }
}
