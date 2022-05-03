//
//  SwiftUIView.swift
//  DisCurrency
//
//  Created by Hubert Le on 4/20/22.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var amount1000: String = ""
    @State private var amount100: String = ""
    @State private var amount10: String = ""
    @State private var amount1: String = ""
    
    @State private var amountdime: String = ""
    @State private var amountpenny: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Swipe Up or down")) {
                    VStack {
                        TextField("", text: $amount1000)
                            .keyboardType(.decimalPad)
                        TextField("Enter an amount", text: $amount100)
                            .keyboardType(.decimalPad)
                    }
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
