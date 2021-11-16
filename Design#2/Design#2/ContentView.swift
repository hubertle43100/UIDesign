//
//  ContentView.swift
//  Design#2
//
//  Created by Hubert Le on 11/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopHeader()
                .padding(.bottom, 20)
            CoffeeHeader()
                .padding(.bottom, 50)
            CoffeeOptions()
                .padding(.bottom, 30)
            AddBasket()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
