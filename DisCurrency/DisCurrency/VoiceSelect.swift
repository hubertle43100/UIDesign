//
//  VoiceSelect.swift
//  DisCurrency
//
//  Created by Hubert Le on 5/2/22.
//

import SwiftUI
import SwiftSpeech

struct VoiceSelect: View {
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
    var yourLocaleString = ""
    var body: some View {
        Form {
            Section(header: Text("Convert to a currency")) {
                TextField("Enter an amount", text: $amount)
                
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
            SwiftSpeech.Demos.Basic(localeIdentifier: yourLocaleString)
                .onRecognizeLatest(update: $amount)
                .frame(width: 300, height: 300, alignment: .center)
                .offset(x: 18, y: -10)
        }.navigationBarTitle(Text("Currency Exchange"))
            .onAppear {
                SwiftSpeech.requestSpeechRecognitionAuthorization()
            }
    }
}

struct VoiceSelect_Previews: PreviewProvider {
    static var previews: some View {
        VoiceSelect()
    }
}
