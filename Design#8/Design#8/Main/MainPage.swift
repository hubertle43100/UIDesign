//
//  MainPage.swift
//  Design#8
//
//  Created by Hubert Le on 1/3/22.
//

import SwiftUI

struct MainPage: View {
    @SwiftUI.Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Group {
            VStack {
                VStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        MainHeader()
                    }
                }.navigationBarTitle("")
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                MainPlot()
                    .padding(.top, 30)
                MainGraph()
                ButtonHeader()
                    .padding()
                    .offset(x:-10)
                MainFinished()
            }
        }.frame(width: 380)
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

struct ButtonHeader: View {
    var body: some View {
        HStack{
            Text("Remind")
                .frame(width: 100, height: 35)
                .background(.white)
                .cornerRadius(30)
                .shadow(radius: 3)
                .padding(.trailing,5)
            
            Text("Point")
                .frame(width: 100, height: 35)
                .background(.white)
                .cornerRadius(30)
                .shadow(radius: 3)
            Spacer()
            Image("refresh")
                .resizable()
                .opacity(0.3)
                .frame(width: 35, height: 35)
                .background(.white)
                .cornerRadius(30)
                .shadow(radius: 3)
        }
    }
}
