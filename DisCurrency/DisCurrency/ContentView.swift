//
//  ContentView.swift
//  DisCurrency
//
//  Created by Hubert Le on 4/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var CurrencySelect = 0
    @State private var CurrencySelect2 = 1
    @State private var amount: String = ""
    
    private let currencies = ["USD", "CAD"]
    
    func convert(_ convert: String) -> String {
        var conversion: Double = 1.0
        let amount = Double(convert.doubleValue)
        let selectedCurrency = currencies[CurrencySelect]
        let to = currencies[CurrencySelect2]
        
        let usdRates = ["USD": 1.0, "CAD": 1.26]
        let cadRates = ["USD": 0.79, "CAD": 1.0]
        
        switch(selectedCurrency) {
        case "USD":
            conversion = amount * (usdRates[to] ?? 0.0)
        case "CAD":
            conversion = amount * (cadRates[to] ?? 0.0)
        default:
            print("No able to convert currency")
        }
        
        return String(format: "%.2f", conversion)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Convert to a currency")) {
                    TextField("Enter an amount", text: $amount)
                        .keyboardType(.decimalPad)
                        
                    
                    Picker(selection: $CurrencySelect2, label: Text("To")) {
                        ForEach(0 ..< currencies.count, id: \.self) { Text(self.currencies[$0]).tag($0)
                        }
                    }
                }
                Section(header: Text("Conversion")) {
                    Text("\(convert(amount)) \(currencies[CurrencySelect2])")
                    
                }
            }.navigationBarTitle(Text("Currency Exchange"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
