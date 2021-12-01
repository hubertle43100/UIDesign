//
//  ChooseOptions.swift
//  Design#6
//
//  Created by Hubert Le on 11/26/21.
//

import SwiftUI

struct ChooseOptions: View {
    var body: some View {
        
        HStack {
            Option()
            Option()
        }
    }
}

struct ChooseOptions_Previews: PreviewProvider {
    static var previews: some View {
        ChooseOptions()
    }
}

struct Option: View {
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Image(systemName: "briefcase.fill")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                }.frame(width: 80, height: 80)
                    .background(Color.green)
                    .cornerRadius(100)
                    .padding(.bottom)
                Text("Find a job")
                    .font(.system(size: 19).bold())
                    .padding(.bottom,1)
                Text("It's easy to find your dream jobs here with us.")
                    .lineLimit(3)
                    .frame(width: 180, height: 80)
                    .multilineTextAlignment(.center)
            }.frame(width: 200, height: 250)
                .background(Color(#colorLiteral(red: 0.9582590461, green: 0.9727497697, blue: 0.9765676856, alpha: 1)))
                .cornerRadius(20)
        }.frame(width: 205, height: 255)
            .background(Color.green)
            .cornerRadius(20)
    }
}
