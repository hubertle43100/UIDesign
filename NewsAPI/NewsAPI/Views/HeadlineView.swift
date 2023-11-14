//
//  HeadlineView.swift
//  NewsAPI
//
//  Created by Hubert Le on 11/13/23.
//

import SwiftUI
import URLImage
import SwiftSoup

struct HeadlineView: View {
    let article: Article
    @State private var paragraphs: [String] = []
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    if let range = article.title?.range(of: " - ") {
                        Text(String(article.title?.prefix(upTo: range.lowerBound) ?? ""))
                    } else {
                        Text(article.title ?? "")
                    }
                    Spacer()
                }
                .font(.system(size: 24, weight: .semibold))
                if let image = article.image,
                   let url = URL(string: image){
                    
                    URLImage(url: url,
                             options: URLImageOptions(
                                identifier: article.id.uuidString,      // Custom identifier
                                cachePolicy: .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.25) // Return cached image or download after delay
                             ),
                             failure: { error, retry in         // Display error and retry button
                        ErrorImage()
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
                VStack {
                    
                    ForEach(paragraphs, id: \.self) { paragraph in
                        HStack {
                            Text(paragraph)
                                .padding(.bottom)
                            Spacer()
                        }
                    }
                }.padding(.top)
            }
        }
        .padding()
        .onAppear(perform: {
            // Replace the URL with the one you want to fetch
            fetchHTMLContent(from: article.url ?? "")
        })
        
    }
    func fetchHTMLContent(from urlString: String) {
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data = data {
                        if let htmlString = String(data: data, encoding: .utf8) {
                            parseHTML(htmlString)
                        }
                    }
                }.resume()
            }
        }
    }
    
    func parseHTML(_ htmlString: String) {
        do {
            let doc = try SwiftSoup.parse(htmlString)
            let paragraphs = try doc.select("p").prefix(5).map { try $0.text() }
            DispatchQueue.main.async {
                self.paragraphs = paragraphs
            }
        } catch {
            print("Error parsing HTML: \(error.localizedDescription)")
        }
    }
}

//struct HeadlineView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeadlineView()
//    }
//}
