//
//  ContentView.swift
//  Design#6
//
//  Created by Hubert Le on 11/24/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    ZStack {
                        IntroPage()
                    }
                    NavigationLink(destination: JobTypePage()) {
                        Text("Get Started")
                            .foregroundColor(.white)
                            .frame(width: 200, height:65)
                    }.frame(width: 200, height:65)
                        .background(Color(#colorLiteral(red: 0.8674479127, green: 0.6583648324, blue: 0.6540154219, alpha: 1)))
                        .cornerRadius(10)
                        .offset(x: 0, y: 40)
                }.offset(x: 0, y: -70)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
