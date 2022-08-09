//
//  MainFinished.swift
//  Design#8
//
//  Created by Hubert Le on 1/7/22.
//

import SwiftUI

struct MainFinished: View {
    var body: some View {
        ZStack {
            HStack {
                HStack {
                    HStack {
                        VStack {
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15).bold())
                        }.frame(width: 30, height: 30)
                            .background(.green)
                            .cornerRadius(50)
                        
                    }.frame(width: 40, height: 40)
                }.frame(width: 50, height: 50)
                    .background(Color(#colorLiteral(red: 0.9115574956, green: 0.9866877198, blue: 0.9379794002, alpha: 1)))
                .cornerRadius(10)
                VStack {
                    Text("Project 7 Completed")
                        .font(.system(size: 20).bold())
                    HStack {
                        Text("Submitted by")
                        Text("@Katherine @Thomas")
                            .foregroundColor(.blue)
                    }.font(.system(size: 10.3))
                }
                Spacer()
                HStack {
                    Image(systemName: "chevron.right")
                        .opacity(0.3)
                }.frame(width: 35, height: 35)
                    .background(Color(#colorLiteral(red: 0.9559772611, green: 0.9609491229, blue: 0.9694693685, alpha: 1)))
                    .cornerRadius(20)
                    .padding(.trailing)
            }.frame(width: 360)
        }.frame(width: 370, height: 70)
            .background(.white)
            .cornerRadius(10)
            .shadow(radius: 2)
    }
}

struct MainFinished_Previews: PreviewProvider {
    static var previews: some View {
        MainFinished()
    }
}
