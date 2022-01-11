//
//  ContentView.swift
//  Design#8
//
//  Created by Hubert Le on 12/31/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7501449585, green: 0.6150712371, blue: 0.999602735, alpha: 1)), Color(#colorLiteral(red: 0.4125382304, green: 0.5333873034, blue: 0.982714951, alpha: 1)), Color(#colorLiteral(red: 0.2645410597, green: 0.415674895, blue: 0.9289607406, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    NavigationLink(destination: MainPage()){
                        Header()
                        .padding(.bottom,0)
                    }
                    Computer()
                        .padding(.top,0)
                    HStack {
                        Text("Office Cooperation")
                            .padding(.top,0)
                            .font(.system(size: 50))
                            .frame(width: 350, height: 150)
                            .lineLimit(2)
                            .offset(x: 40,y: -40)
                        Spacer()
                    }
                    Text("Teamwork to quickly advance project progress, and timely query of project status")
                        .frame(width: 350, height: 50)
                        .offset(y: -40)
                    Spacer()
                    NavigationLink(destination: MainPage()){
                        HStack {
                            Image(systemName: "person.fill")
                            Text("User Login")
                        }.frame(width: 350, height: 60)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7445564866, green: 0.9464932084, blue: 0.7101495862, alpha: 1)), Color(#colorLiteral(red: 0.3133866191, green: 0.7646824718, blue: 0.8200220466, alpha: 1)), Color(#colorLiteral(red: 0.2981831133, green: 0.6453713775, blue: 0.9016084075, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                                
                            )
                            .cornerRadius(50)
                        .offset(y: -5)
                    }
                }.foregroundColor(.white)
                    .offset(y: -50)
            }
        }
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
                    .font(.system(size: 20).bold())
                Text("OSOFFICE")
                    .font(.system(size: 17).bold())
                    .padding()
                Spacer()
                VStack {
                    HStack {
                        Text("Skip")
                        Image(systemName: "arrow.right")
                            .font(.system(size: 17).bold())
                    }.offset(x:80)
                }
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
        Group {
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
        }.frame(width: 380)
    }
}
