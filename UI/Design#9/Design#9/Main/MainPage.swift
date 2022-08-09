//
//  MainPage.swift
//  Design#9
//
//  Created by Hubert Le on 1/18/22.
//

import SwiftUI

struct MainPage: View {
    @State private var username: String = ""
    var body: some View {
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
            }.padding(.bottom)
            HStack {
                Text("Morning best food")
                    .font(.system(size: 30).bold())
                Spacer()
            }.padding(.bottom)
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
            }.padding(.bottom)
            HStack {
                Text("Categories")
                    .font(.system(size: 20).bold())
                Spacer()
            }.padding(.bottom)
            HStack {
                Group {
                    Text("Masshaito")
                    Text("Risretto")
                    Text("Black")
                }.frame(width: 100, height: 30)
                    .background(Color(#colorLiteral(red: 0.00678233197, green: 0.3030061126, blue: 0.1682294607, alpha: 1)))
                    .cornerRadius(30)
                    .foregroundColor(.white)
                Spacer()
            }.padding(.bottom)
            CoffeeSelection()
                .padding(.bottom)
            HStack {
                Text("Special offer")
                    .font(.system(size: 20).bold())
                Image("trending")
                    .resizable()
                    .frame(width: 20, height: 20)
                Spacer()
            }.padding(.bottom)
            SpecialCoffee()
                .padding(.bottom)
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
