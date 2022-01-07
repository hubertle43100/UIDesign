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
            
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
