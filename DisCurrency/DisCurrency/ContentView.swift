//
//  ContentView.swift
//  DisCurrency
//
//  Created by Hubert Le on 4/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var CurrencySelect = 0
    @State private var amount: String = ""
    private let currencies = ["USD to CAD", "CAD to USD"]
    
    var convUSD = "USD to CAD"
    var convCAD = "CAD to USD"
    
    
    func convert(_ convert: String) -> String {
        var conversion: Double = 0.0
        let amount = Double(convert.doubleValue)
        let selectedCurrency = currencies[CurrencySelect]
        
        switch(selectedCurrency) {
        case convUSD:
            conversion = amount * 1.26
        case convCAD:
            conversion = amount * 0.79
        default:
            print("\(Error.self)")
        }
        
        return String(format: "%.2f", conversion)
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Convert to a currency")) {
                    TextField("Enter an amount", text: $amount)
                        .keyboardType(.decimalPad)
                        .onTapGesture {
                            self.hideKeyboard()
                        }
                    
                    Picker(selection: $CurrencySelect, label:
                            Text("From")) {
                        ForEach(0 ..< currencies.count, id: \.self) { Text(self.currencies[$0]).tag($0)
                        }
                    }
                }
                Section(header: Text("Conversion")) {
                    switch(currencies[CurrencySelect]) {
                    case convUSD:
                        Text("\(convert(amount)) CAD")
                    case convCAD:
                        Text("\(convert(amount)) USD")
                    default:
                        Text("0")
                    }
                    
                }
                Section(header: Text("Gesture Input")) {
                    NavigationLink(destination: MoneySelect()) {
                        Text("Gesture Convert")
                            .foregroundColor(Color.green)
                        
                    }
                }
                Section(header: Text("Voice Input")) {
                    NavigationLink(destination: VoiceSelect()) {
                        Text("Speech Convert")
                            .foregroundColor(Color.green)
                        
                    }
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

extension ContentView {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
