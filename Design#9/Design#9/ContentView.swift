//
//  ContentView.swift
//  Design#9
//
//  Created by Hubert Le on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    var body: some View {
        Group {
            VStack {
                HStack {
                    Image("1574122306")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                    Spacer()
                    Image("location_on")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Country in North America")
                    Spacer()
                    Image(systemName: "bell")
                }
                HStack {
                    Text("Morning best food")
                        .font(.system(size: 30).bold())
                    Spacer()
                }
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding()
                        VStack {
                            TextField("Search for drinks ...", text: $username)
                        }
                        Spacer()
                    }.frame(width: 360, height: 40)
                        .background(Color(#colorLiteral(red: 0.9762765765, green: 0.9762766957, blue: 0.9762765765, alpha: 1)))
                        .cornerRadius(40)
                    ZStack {
                        Image("menu 2")
                            .resizable()
                        .frame(width: 20, height: 20)
                    }.frame(width: 40, height: 40)
                        .background(Color(#colorLiteral(red: 0.7387881875, green: 0.5716782212, blue: 0.3622662723, alpha: 1)))
                        .cornerRadius(40)
                }
                HStack {
                    Text("Categories")
                        .font(.system(size: 20).bold())
                    Spacer()
                }
                
            }
        }.frame(width: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
