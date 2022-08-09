//
//  MainHeader.swift
//  Design#8
//
//  Created by Hubert Le on 1/5/22.
//

import SwiftUI

struct MainHeader: View {
    var body: some View {
        Group {
            VStack {
                HStack {
                    Image("fornite")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                    VStack {
                        Text("Charles")
                            .font(.system(size: 16,weight: .heavy))
                            .foregroundColor(.black)
                        Text("Lv 5")
                            .font(.system(size: 14))
                            .frame(width: 50, height: 20)
                            .background(.blue)
                            .cornerRadius(30)
                            .foregroundColor(.white)
                            .offset(x:-5, y: -10)
                    }
                    Spacer()
                    Group {
                        HStack {
                            Spacer()
                            Image(systemName: "bell")
                            Spacer()
                            Text("|")
                                .opacity(0.5)
                            Spacer()
                            Image(systemName: "star")
                            Spacer()
                        }.foregroundColor(.black)
                        .frame(width: 100, height: 45)
                        .background(.white)
                        .cornerRadius(30)
                    .shadow(radius: 3)
                    }
                    ZStack {
                    }.frame(width: 5, height: 5)
                        .background(.red)
                        .cornerRadius(50)
                        .offset(x:-75,y:-10)
                    
                    HStack {
                        Image(systemName: "square.grid.2x2")
                            .foregroundColor(.black)
                    }.frame(width: 45, height: 45)
                        .background(.white)
                        .cornerRadius(50)
                        .shadow(radius: 3)
                        
                }.padding(.bottom)
                HStack {
                    Text("Teamwork Data")
                        .font(.system(size: 30).bold())
                        .foregroundColor(.black)
                    Spacer()
                }
                HStack {
                    Text("Last month's data")
                        .foregroundColor(.black)
                        .opacity(0.5)
                    Spacer()
                    HStack {
                        Text("More")
                        Image(systemName: "chevron.down")
                            .font(.system(size: 13))
                    }.frame(width: 80, height: 30)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(30)
                }.offset(x:5,y:-25)
            }
        }.frame(width: 380)
    }
}

struct MainHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainHeader()
    }
}
