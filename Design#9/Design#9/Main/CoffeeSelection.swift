//
//  CoffeeSelection.swift
//  Design#9
//
//  Created by Hubert Le on 1/15/22.
//

import SwiftUI

struct CoffeeSelection: View {
    var body: some View {
        HStack {
            CoffeeSquares(image: "latte", name: "Masshaito", desc: "Coffee Because", price: "5.05")
                .padding(.trailing)
            CoffeeSquares(image: "matcha", name: "Matcha", desc: "Tea Because", price: "6.05")
        }
    }
}

struct CoffeeSelection_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeSelection()
    }
}

struct CoffeeSquares: View {
    var image: String
    var name: String
    var desc: String
    var price: String
    
    var body: some View {
        VStack {
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
                HStack {
                    Text(name)
                        .font(.system(size: 20).bold())
                    Spacer()
                }
                HStack {
                    Text(desc)
                        .font(.system(size: 15))
                        .opacity(0.5)
                    Spacer()
                }
                HStack {
                    Image("dollar-symbol")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 15, height: 15)
                    Text(price)
                        .offset(x:-10, y:-2)
                        .font(.system(size: 23).bold())
                    Spacer()
                    Text("+")
                        .font(.system(size: 20).bold())
                        .offset(x:0,y:-1)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.1134066507, green: 0.3488509655, blue: 0.2506779134, alpha: 1)))
                        .cornerRadius(30)
                }
            }.frame(width: 150)
        }.frame(width: 170, height: 270)
            .background(Color(#colorLiteral(red: 0.9762765765, green: 0.9762766957, blue: 0.9762765765, alpha: 1)))
            .cornerRadius(20)
    }
}
