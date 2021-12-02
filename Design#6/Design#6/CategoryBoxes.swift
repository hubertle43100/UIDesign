//
//  CategoryBoxes.swift
//  Design#6
//
//  Created by Hubert Le on 12/2/21.
//

import SwiftUI

struct CategoryBoxes: View {
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Box(image: "illustration", title: "Design", description: "1000+ jobs")
                        .padding(.trailing)
                    Box(image: "growth", title: "Business", description: "1200+ jobs")
                }.padding(.bottom)
                HStack {
                    Box(image: "stethoscope", title: "Medical", description: "1200+ jobs")
                        .padding(.trailing)
                    Box(image: "cinema", title: "Media", description: "1200+ jobs")
                }.padding(.bottom)
                HStack {
                    Box(image: "education", title: "Education", description: "1200+ jobs")
                        .padding(.trailing)
                    Box(image: "restaurant", title: "restaurant", description: "1200+ jobs")
                }.padding(.bottom)
                HStack {
                    Box(image: "tank", title: "Army", description: "1200+ jobs")
                        .padding(.trailing)
                    Box(image: "teamwork", title: "Management", description: "1200+ jobs")
                }
            }
        }.frame(width: 380)
    }
}

struct CategoryBoxes_Previews: PreviewProvider {
    static var previews: some View {
        CategoryBoxes()
    }
}

struct Box: View {
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.bottom,10)
                Text(title)
                    .font(.system(size: 19).bold())
                    .padding(.bottom,1)
                Text(description)
                    .opacity(0.6)
            }.frame(width: 150, height: 180)
                .background(Color.white)
        }.cornerRadius(20)
            .shadow(color: .gray, radius:3, x: -1, y: 1)
    }
}
