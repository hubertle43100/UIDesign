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
            DrinksHeader()
            CoffeeDetail()
            DrinksHeader()
            CoffeeSize()
            
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
            .background(Color(#colorLiteral(red: 0.8734650016, green: 0.9499548078, blue: 0.9242818952, alpha: 1)))
            .cornerRadius(25)
    }
}

struct CoffeeDetail: View {
    var body: some View {
        HStack {
            Coffee(drinks: "coffee-beans", drinkName: "Epresso", drinkDescription: "Single")
            Coffee(drinks: "cappuccino", drinkName: "Cappuccino", drinkDescription: "Milk, Foam")
        }
    }
}

struct CoffeeSize: View {
    var body: some View {
        HStack {
            Coffee(drinks: "coffee-beans", drinkName: "Epresso", drinkDescription: "Single")
            Coffee(drinks: "cappuccino", drinkName: "Cappuccino", drinkDescription: "Milk, Foam")
        }
    }
}
