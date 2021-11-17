//
//  MMTime.swift
//  Design#3
//
//  Created by Hubert Le on 11/16/21.
//

import SwiftUI

struct MMTime: View {
    var body: some View {
        HStack {
            TimeSquare(hours: "08", minutes: "20", seconds: "40")
        }
    }
}

struct MMTime_Previews: PreviewProvider {
    static var previews: some View {
        MMTime()
    }
}

struct TimeSquare: View {
    var hours: String
    var minutes: String
    var seconds: String
    
    var body: some View {
        HStack {
            Text(hours)
                .font(.system(size: 19).bold())
                .foregroundColor(.white)
        }.frame(width: 35, height: 40)
            .background(Color(#colorLiteral(red: 0.3092537224, green: 0.6789684296, blue: 0.9940473437, alpha: 1)))
            .cornerRadius(10)
        Text(":")
            .font(.system(size: 15).bold())
            .foregroundColor(Color.white)
        HStack {
            Text(minutes)
                .font(.system(size: 19).bold())
                .foregroundColor(.white)
        }.frame(width: 35, height: 40)
            .background(Color(#colorLiteral(red: 0.3092537224, green: 0.6789684296, blue: 0.9940473437, alpha: 1)))
            .cornerRadius(10)
        Text(":")
            .font(.system(size: 15).bold())
            .foregroundColor(Color.white)
        HStack {
            Text(seconds)
                .font(.system(size: 19).bold())
                .foregroundColor(.white)
        }.frame(width: 35, height: 40)
            .background(Color(#colorLiteral(red: 0.3092537224, green: 0.6789684296, blue: 0.9940473437, alpha: 1)))
            .cornerRadius(10)
    }
}
