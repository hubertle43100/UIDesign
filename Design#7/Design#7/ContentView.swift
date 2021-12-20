//
//  ContentView.swift
//  Design#7
//
//  Created by Hubert Le on 12/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("wreath")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.top,50)
                Spacer()
                Text("Christmas Box")
                    .font(.custom("Christmas Cards xxx", size: 45).bold())
                    .foregroundColor(Color(#colorLiteral(red: 0.9999018312, green: 1, blue: 0.9998798966, alpha: 1)))
                    .padding(.bottom,200)
                Spacer()
                Text("Get ready for Christmas with our app. Make gift lists. Calculate the budget correctly. Send congratulations. Plan your perfect holidays.")
                    .font(Font.custom("Christmas Bell", size: 18))
                    .foregroundColor(Color(#colorLiteral(red: 0.1490006149, green: 0.1490328908, blue: 0.148996383, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .lineLimit(4)
                    .frame(width: 300)
                    .padding(.bottom,30)
                VStack {
                    Text("Let's Begin")
                        .frame(width: 300, height: 60)
                    
                }
                    .background(.white)
                    .cornerRadius(50)
                    .shadow(color: .gray, radius: 2, x: 2, y: 5)
                    
            }
           }
           .background(
               Image("BWChristmas")
                   .resizable()
                   .edgesIgnoringSafeArea(.all)
                   .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
           )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
