//
//  ContentView.swift
//  Design#8
//
//  Created by Hubert Le on 12/31/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.vertical)
                    .overlay(VStack {
                        Header()
                        Computer()
                        HStack {
                            Text("Office Cooperation")
                                .font(.system(size: 50))
                                .frame(width: 350, height: 150)
                            .lineLimit(2)
                            Spacer()
                        }
                        Text("Teamwork to quickly advance project progress, and timely query of project status")
                            .frame(width: 350, height: 50)
                    }.foregroundColor(.white))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Header: View {
    var body: some View {
        Group {
            HStack {
                Image(systemName: "target")
                Text("OSOFFICE")
                    .padding()
                Spacer()
                HStack {
                    Text("Skip")
                    Image(systemName: "arrow.right")
                }.offset(x:80)
                HStack {
                }.frame(width: 80, height: 30)
                    .background(.white)
                    .opacity(0.5)
                    .cornerRadius(20)
            }.frame(width: 380)
        }.foregroundColor(.white)
    }
}

struct Computer: View {
    var body: some View {
        ZStack {
            HStack {
                
            }.frame(width: 300, height: 450)
                .background(.white)
                .cornerRadius(500)
            Image("hexGlitch")
                .resizable()
                .frame(width: 500, height: 500)
                .offset(x:-10, y: -30)
            Image("hexGlitch")
                .resizable()
                .frame(width: 500, height: 500)
                .offset(x:10, y:10)
            
            Image("oldcomputer")
                .resizable()
                .frame(width: 350, height: 350)
                .offset(x:40)
            
        }
    }
}
