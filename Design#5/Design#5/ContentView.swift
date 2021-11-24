//
//  ContentView.swift
//  Design#5
//
//  Created by Hubert Le on 11/23/21.
//

import SwiftUI

struct ContentView: View {
    @State private var currentStep = 0
    
    var body: some View {
        
        VStack {
            
            Image("delivery")
                .resizable()
                .scaledToFit()
                .frame(width: 450, height: 450)
                .clipShape(Circle())
            HStack {
                Spacer()
                Text("Choose Your Favorite Food")
                    .lineLimit(2)
                    .font(.system(size: 25).bold())
                .frame(width: 180, height: 80, alignment: .leading)
            }.frame(width: 350, height: 80)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
