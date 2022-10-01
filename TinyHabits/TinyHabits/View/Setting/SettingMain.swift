//
//  SettingMain.swift
//  TinyHabits
//
//  Created by Hubert Le on 8/9/22.
//

import SwiftUI
import PassKit

struct SettingMain: View {
    @State private var color: Color = Color.white
    @State private var fore: Color = Color.blue
    private var colorData = ColorData()
    
    var body: some View {
        NavigationView {
            ZStack {
                color
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        Header(Title: "Setting").padding(.bottom, 50)
                        NavigationLink(destination: ColorThemes(), label: {
                            ColorChange()
                        })
                        //Donation()
                    }
                }
            }.onAppear {
                color = colorData.loadColor()
            }
        }
    }
}

struct ColorChange: View {
    @State private var fore: Color = Color.blue
    private var colorData = ColorData()
    
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
        .background(fore)
        .cornerRadius(8)
        .onAppear {
            fore = colorData.loadForegroundColor()
        }
    }
}

struct Donation: View {
    @State private var fore: Color = Color.blue
    private var colorData = ColorData()
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
            .background(fore)
            .cornerRadius(8)
            .onAppear {
                fore = colorData.loadForegroundColor()
            }
    }
}

struct SettingMain_Previews: PreviewProvider {
    static var previews: some View {
        SettingMain()
    }
}
