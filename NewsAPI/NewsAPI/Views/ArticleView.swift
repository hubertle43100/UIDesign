//
//  ArticleView.swift
//  NewsAPI
//
//  Created by Tunde on 10/02/2021.
//

import SwiftUI
import UIKit
import URLImage

struct ArticleView: View {
    
    let article: Article
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        HStack() {
            if let image = article.image,
               let url = URL(string: image){
               
                URLImage(url: url,
                         options: URLImageOptions(
                            identifier: article.id.uuidString,      // Custom identifier
                            cachePolicy: .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.25) // Return cached image or download after delay
                                          ),
                         failure: { error, retry in         // Display error and retry button
                            Caution()
                         },
                         content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                         })
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            } else {
                Caution()
            }

            
            VStack(alignment: .leading, spacing: 4) {
                
                if let range = article.title?.range(of: " - ") {
                    Text(String(article.title?.prefix(upTo: range.lowerBound) ?? ""))
                        .font(.system(size: 14, weight: .semibold))
                } else {
                    Text(article.title ?? "")
                }
                Text(article.source ?? "")
                    .foregroundColor(.gray)
                    .font(.system(size: 12, weight: .regular))
            }
            Spacer()
        }.frame(width: screenSize.width * 0.9).background(Color("LightDark"))
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}

struct Caution: View {
    var body: some View {
        Image("Stocks") // Use the SF Symbol for error
            .resizable()
            .frame(width: 100, height: 100)
            .cornerRadius(10)
    }
}
