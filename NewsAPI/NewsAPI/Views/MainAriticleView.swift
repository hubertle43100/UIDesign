//
//  MainAriticleView.swift
//  NewsAPI
//
//  Created by Hubert Le on 4/14/22.
//

import SwiftUI
import UIKit
import URLImage

struct MainAriticleView: View {
    
    let article: Article
    
    var body: some View {
        VStack {
            if let image = article.image,
               let url = URL(string: image){
                
                URLImage(url: url,
                         options: URLImageOptions(
                            identifier: article.id.uuidString,      // Custom identifier
                            cachePolicy: .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.25) // Return cached image or download after delay
                         ),
                         failure: { error, retry in         // Display error and retry button
                    Image("stocks") // Use the SF Symbol for error
                        .resizable()
                        .cornerRadius(10)
                },
                         content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                })
                .frame(maxWidth: UIScreen.main.bounds.width - 20,
                       maxHeight: 200)
                .cornerRadius(10)
            }
            HStack {
                Text(article.source ?? "")
                    .font(.system(size: 14, weight: .regular))
                    .opacity(0.5)
                Spacer()
            }
            HStack {
                if let range = article.title?.range(of: " - ") {
                    Text(String(article.title?.prefix(upTo: range.lowerBound) ?? ""))
                } else {
                    Text(article.title ?? "")
                }
                Spacer()
            }
            .foregroundColor(.black)
            .font(.system(size: 24, weight: .semibold))
        }.padding()
    }
}

struct MainAriticleView_Previews: PreviewProvider {
    static var previews: some View {
        MainAriticleView(article: Article.dummyData)
    }
}
