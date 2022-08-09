//
//  CoffeeOptions.swift
//  Design#2
//
//  Created by Hubert Le on 11/13/21.
//

import SwiftUI

struct CoffeeOptions: View {
    var body: some View {
        VStack {
            ChooseYour(menuItem: "Item")
            CoffeeDetail()
                .padding(.leading, 30)
                .padding(.bottom, 30)
            ChooseYour(menuItem: "Size")
            CoffeeSize()
                .padding(.leading, 30)
            
        }
    }
}

struct CoffeeOptions_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeOptions()
    }
}

struct Coffee: View {
    var drinks: String
    var drinkName: String
    var drinkDescription: String
    
    var body: some View {
            VStack {
                Image(drinks)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.bottom,15)
                Text(drinkName)
                    .font(.system(size: 20).bold())
                    .padding(.bottom,1)
                Text(drinkDescription)
                    .font(.system(size: 15))
            } .frame(width: 150, height: 175)
              .cornerRadius(25)
    }
}

struct CoffeeDetail: View {
    var body: some View {
        ScrollView (.horizontal) {
            HStack {
                Coffee(drinks: "matcha", drinkName: "Matcha Latte", drinkDescription: "Milk").background(Color(#colorLiteral(red: 0.8734650016, green: 0.9499548078, blue: 0.9242818952, alpha: 1)))
                    .cornerRadius(25)
                Coffee(drinks: "cakepop", drinkName: "Cakepop", drinkDescription: "Bakery")
                Coffee(drinks: "lemonade", drinkName: "Lemonade acai", drinkDescription: "Bakery")
            }
        }
    }
}

struct CoffeeSize: View {
    var body: some View {
        ScrollView (.horizontal) {
            HStack {
                Coffee(drinks: "coffee-cup-small", drinkName: "Tall", drinkDescription: "small")
                Coffee(drinks: "cup", drinkName: "Grande", drinkDescription: "medium")
                Coffee(drinks: "hot-drink", drinkName: "Venti", drinkDescription: "large").background(Color(#colorLiteral(red: 0.9135054946, green: 0.9503828883, blue: 0.9997966886, alpha: 1)))
                    .cornerRadius(25)
            }
        }
    }
}

struct ChooseYour: View {
    var menuItem: String
    var body: some View {
        HStack {
            Text("Chose Your " + menuItem)
                .font(.system(size: 20).bold())
                .frame(maxWidth: 360, alignment: .leading)
        }
    }
}
