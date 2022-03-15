//
//  NewsResponse.swift
//  DesignPlus#2
//
//  Created by Hubert Le on 2/28/22.
//

import Foundation

// MARK: 1. Setting up and creating our model

//Website: app.quicktype.io (generate struct variables)
struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable { //Note: Working with a list, you need everyitem to be unique
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        
        //Note: description is used for something else so needs another name
        case articleDescription = "description"
        case image, date
    }
}

//Creating dummy data
extension Article {
    static var dummyData: Article {
        .init(author: "Joseph Wulfsohn", url: "https://www.foxnews.com/media/new-york-magazine-jonathan-chait-gina-carano-disney-hollywood-blacklist", source: "Fox News", title: "Disney's Gina Carano firing denounced as 'Hollywood Blacklist' against conservatives - Fox News", articleDescription: "Conservative actress Gina Carano found rare support among liberals in the mainstream media following her firing from \"The Mandalorian\" over social media posts and being dropped by her agency UTA.", image: "https://static.foxnews.com/foxnews.com/content/uploads/2021/02/Gina-Carano.jpg", date: Date())
    }
}

