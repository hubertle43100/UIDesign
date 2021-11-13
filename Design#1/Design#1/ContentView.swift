//
//  ContentView.swift
//  Design#1
//
//  Created by Hubert Le on 11/3/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderSection()
                .offset(y: -30)
            HeaderText()
                .padding(.top, 50)
            TicketSlider()
                .padding(.top, 5)
            //Deselect()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderText: View {
    //Ticket Information
    var body: some View {
        HStack {
            Text("Ticket Information")
                .font(.system(size: 25, weight: .bold, design: .default))
            Spacer()
        }.padding(.horizontal, 30)
    }
}
