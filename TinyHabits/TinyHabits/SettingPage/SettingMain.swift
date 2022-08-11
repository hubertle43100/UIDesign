//
//  SettingMain.swift
//  TinyHabits
//
//  Created by Hubert Le on 8/9/22.
//

import SwiftUI

struct SettingMain: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Header(Title: "Setting").padding(.bottom, 50)
                    ColorChange()
                    Donation()
                }
            }
        }
    }
}

struct ColorChange: View {
    var body: some View {
        Button {
            
        } label: {
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
        }.frame(width: 335, height: 125)
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(8)
    }
}

struct Donation: View {
    var body: some View {
        Button {
            
        } label: {
            HStack {
                VStack {
                    Text("Gimme a cake pop!").offset(x:-13)
                        .font(Font.custom("SourceCodePro-Bold", size: 20))
                    Text("Donations are appriciated and will allow me to buy some cake pop. Thanks!").opacity(0.7)
                        .font(Font.custom("SourceCodePro-Bold", size: 15))
                }.multilineTextAlignment(.leading)
                    .padding()
                
                Image("cake-pop")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.trailing)
            }
        }.frame(width: 335, height: 125)
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(8)
    }
}

struct SettingMain_Previews: PreviewProvider {
    static var previews: some View {
        SettingMain()
    }
}
