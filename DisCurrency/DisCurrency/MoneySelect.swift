//
//  MoneySelect.swift
//  DisCurrency
//
//  Created by Hubert Le on 4/20/22.
//

import SwiftUI

struct MoneySelect: View {
    @State private var CurrencySelect = 0
    @State private var amount: String = ""
    private let currencies = ["USD to CAD", "CAD to USD"]
    
    var convUSD = "USD to CAD"
    var convCAD = "CAD to USD"
    
    @State private var amount1000: String = ""
    @State private var amount100: String = ""
    @State private var amount10: String = ""
    @State private var amount1: String = ""
    
    @State private var amountdime: String = ""
    @State private var amountpenny: String = ""
    
    @State private var value = 0.0
    @State private var value1000 = 0
    @State private var value100 = 0
    @State private var value10 = 0
    @State private var value1 = 0
    @State private var valuedime = 0.0
    @State private var valuepenny = 0.0
    
    func convert(_ convert: String) -> String {
        var conversion: Double = 0.0
        let value = Double(convert.doubleValue)
        let selectedCurrency = currencies[CurrencySelect]
        
        switch(selectedCurrency) {
        case convUSD:
            conversion = value * 1.26
        case convCAD:
            conversion = value * 0.79
        default:
            print("\(Error.self)")
        }
        
        return String(format: "%.2f", conversion)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Swipe Up or down for Selected values")) {
                        TextField("$1000", text: $amount1000)
                            .accessibilityAdjustableAction { direction in
                                switch direction {
                                case .increment:
                                        value += 1000
                                        value1000 += 1000
                                        amount1000 = "\(value1000)"
                                case .decrement:
                                    if(value1000 >= 1000) {
                                        value -= 1000
                                        value1000 -= 1000
                                        amount1000 = "\(value1000)"
                                    }
                                default:
                                    print("Not handled")
                                }
                            }
                        TextField("$100", text: $amount100)
                            .accessibilityAdjustableAction { direction in
                                switch direction {
                                case .increment:
                                    if(value100 < 900) {
                                        value += 100
                                        value100 += 100
                                        amount100 = "\(value100)"
                                    }
                                case .decrement:
                                    if(value100 >= 100) {
                                        value -= 100
                                        value100 -= 100
                                        amount100 = "\(value100)"
                                    }
                                default:
                                    print("Not handled")
                                }
                            }
                            TextField("$10", text: $amount10)
                            .accessibilityAdjustableAction { direction in
                                switch direction {
                                case .increment:
                                    if(value10 < 90) {
                                        value += 10
                                        value10 += 10
                                        amount10 = "\(value10)"
                                    }
                                case .decrement:
                                    if(value10 >= 10) {
                                        value -= 10
                                        value10 -= 10
                                        amount10 = "\(value10)"
                                    }
                                default:
                                    print("Not handled")
                                }
                            }
                            TextField("$1", text: $amount1)
                            .accessibilityAdjustableAction { direction in
                                switch direction {
                                case .increment:
                                    if(value1 < 9) {
                                        value += 1
                                        value1 += 1
                                        amount1 = "\(value1)"
                                    }
                                case .decrement:
                                    if(value1 >= 1) {
                                        value -= 1
                                        value1 -= 1
                                        amount1 = "\(value1)"
                                    }
                                default:
                                    print("Not handled")
                                }
                            }
                            TextField("$0.10", text: $amountdime)
                            .accessibilityAdjustableAction { direction in
                                switch direction {
                                case .increment:
                                    if(valuedime < 0.8) {
                                        value += 0.1
                                        valuedime += 0.1
                                        amountdime = "\(String(format: "%.2f", valuedime))"
                                    }
                                case .decrement:
                                    if(valuedime >= 0.1) {
                                        value -= 0.1
                                        valuedime -= 0.1
                                        amountdime = "\(String(format: "%.2f", valuedime))"
                                    }
                                default:
                                    print("Not handled")
                                }
                            }
                            TextField("$0.01", text: $amountpenny)
                                .accessibilityAdjustableAction { direction in
                                    switch direction {
                                    case .increment:
                                        if(valuepenny < 0.09) {
                                            value += 0.01
                                            valuepenny += 0.01
                                            amountpenny = "\(String(format: "%.2f", valuepenny))"
                                        }
                                    case .decrement:
                                        if(valuepenny >= 0.01) {
                                            value -= 0.01
                                            valuepenny -= 0.01
                                            amountpenny = "\(String(format: "%.2f", valuepenny))"
                                        }
                                    default:
                                        print("Not handled")
                                    }
                                }
                    }
                    Section(header: Text("Total")) {
                        Text("\(String(format: "%.2f", value))")
                    }
                    Section(header: Text("Conversion")) {
                        Picker(selection: $CurrencySelect, label:
                                Text("From")) {
                            ForEach(0 ..< currencies.count, id: \.self) { Text(self.currencies[$0]).tag($0)
                            }
                        }
                        switch(currencies[CurrencySelect]) {
                        case convUSD:
                            Text("\(convert("\(value)")) CAD")
                        case convCAD:
                            Text("\(convert("\(value)")) USD")
                        default:
                            Text("0")
                        }
                        
                    }
                }
                
            }.offset(x: 0, y: -130)
        }
    }
}

struct MoneySelect_Previews: PreviewProvider {
    static var previews: some View {
        MoneySelect()
    }
}

