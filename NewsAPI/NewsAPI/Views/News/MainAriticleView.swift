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
        ZStack {
            // TODO: Add image view
            if let image = article.image,
               let url = URL(string: image){
               
                URLImage(url: url,
                         options: URLImageOptions(
                            identifier: article.id.uuidString,      // Custom identifier
                            cachePolicy: .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.25) // Return cached image or download after delay
                                          ),
                         failure: { error, retry in         // Display error and retry button
                            Image("CautionGray")
                                .resizable()
                                .cornerRadius(10)
                         },
                         content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                         })
                .frame(maxWidth: UIScreen.main.bounds.width-40,
                       maxHeight: UIScreen.main.bounds.height*0.4)
                    .cornerRadius(10)
            } else {
                Image("CautionGray")
                    .resizable()
                    .cornerRadius(10)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(article.source ?? "")
                    .background(Rectangle().fill(Color.gray).opacity(0.6).shadow(radius: 3).cornerRadius(5))
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .semibold))
                Spacer()
                Text(article.title ?? "")
                    .background(Rectangle().fill(Color.gray).opacity(0.6).shadow(radius: 3).cornerRadius(5))
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                    
                    
            }.frame(maxWidth: UIScreen.main.bounds.width-40,
                    maxHeight: UIScreen.main.bounds.height*0.4)
        }
    }
}

struct MainAriticleView_Previews: PreviewProvider {
    static var previews: some View {
        MainAriticleView(article: Article.dummyData)
    }
}
