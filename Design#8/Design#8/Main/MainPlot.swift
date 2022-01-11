//
//  MainPlot.swift
//  Design#8
//
//  Created by Hubert Le on 1/8/22.
//

import SwiftUI

struct MainPlot: View {
    var body: some View {
        ZStack {
            VStack {
                
            }.frame(width: 360, height: 200)
                .background(Color(#colorLiteral(red: 0.8965522647, green: 0.9264645576, blue: 0.9817109704, alpha: 1)))
                .cornerRadius(20)
                .offset(y:-40)
            VStack {
                Image("lineChart-1")
                    .resizable()
                    .frame(width: 350, height: 260)
                    .offset(x:5,y:-10)
            }
            .frame(width: 360, height: 200)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7501449585, green: 0.6150712371, blue: 0.999602735, alpha: 1)), Color(#colorLiteral(red: 0.4125382304, green: 0.5333873034, blue: 0.982714951, alpha: 1)), Color(#colorLiteral(red: 0.2645410597, green: 0.415674895, blue: 0.9289607406, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
            
        }
    }
}

struct MainPlot_Previews: PreviewProvider {
    static var previews: some View {
        MainPlot()
    }
}
