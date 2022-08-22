//
//  SettingMain.swift
//  TinyHabits
//
//  Created by Hubert Le on 8/9/22.
//

import SwiftUI
import PassKit

struct SettingMain: View {
    @State private var color: Color = .clear
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Header(Title: "Setting").padding(.bottom, 50)
                    NavigationLink(destination: ColorThemes(), label: {
                        ColorChange()
                    })
                    Donation()
                }
            }
        }
    }
}

struct ColorChange: View {
    var body: some View {
        HStack {
            VStack {
                Text("Theme/Color Change")
                    .font(Font.custom("SourceCodePro-Bold", size: 20))
                Text("Customize your app with themes that suits you best").opacity(0.7)
                    .font(Font.custom("SourceCodePro-Bold", size: 15))
            }.multilineTextAlignment(.leading)
                .padding()
                .offset(x:-6)
            
            Image("colour")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing)
        }
        .frame(width: 335, height: 125)
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(8)
    }
}

struct Donation: View {
    //@EnvironmentObject var donationManager: DonationManager
    let paymentHandler = PaymentHandler()
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Gimme a cake pop!").offset(x:-13)
                        .font(Font.custom("SourceCodePro-Bold", size: 20))
                    Text("Donations are appriciated and will allow me to buy some cake pop. Thanks!").opacity(0.7)
                        .font(Font.custom("SourceCodePro-Bold", size: 15))
                }
                .multilineTextAlignment(.leading)
                .padding()
                
                Image("cake-pop")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.trailing)
            }
            Button(action: {
                self.paymentHandler.startPayment { (success) in
                    if success {
                        print("Success")
                    } else {
                        print("Failed")
                    }
                }
            }, label: {
                Text("DONATE WITH  APPLE")
                    .font(Font.custom("SourceCodePro-Bold", size: 16))
                    .padding(10)
                    .foregroundColor(.white)
            }).frame(width: 300, height: 30)
                .background(Color.black)
                .cornerRadius(10)
            
        }.frame(width: 335, height: 175)
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(8)
    }
}
//class DonationManager: ObservableObject {
//    @Published private(set) var products: [String] = []
//    @Published private(set) var total: Int = 0
//
//    let paymentHandler = PaymentHandler()
//    @Published private(set) var paymentSuccess = false
//
//    func pay() {
//        paymentHandler.startPayment(products: ["Donating Cake Pop"], total: 2) { success in
//            self.paymentSuccess = success
//            self.products = []
//            self.total = 0
//        }
//    }
//}

struct SettingMain_Previews: PreviewProvider {
    static var previews: some View {
        SettingMain()
    }
}
