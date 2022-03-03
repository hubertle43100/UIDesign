//
//  NewsResponse.swift
//  DesignPlus#2
//
//  Created by Hubert Le on 2/28/22.
//

import Foundation

// MARK: - Welcome
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String
    let url: String
    let source, title, articleDescription: String
    let image: String
    let date: Date

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        
        //description is used for something else so needs another name
        case articleDescription = "description"
        case image, date
    }
}

