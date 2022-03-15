//
//  NewEndpoint.swift
//  DesignPlus#2
//
//  Created by Hubert Le on 3/2/22.
//

import Foundation

// MARK: 2. Piece API string together to create new

protocol APIBuilder { //Note: Used protocol inconsideration of future uses of other APIs(promotes reuseablility
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder {

    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        return "/news"
    }
    var urlRequest: URLRequest {
        //piece all the Strings together to create the following URL: https://api.lil.software/news
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
    
}

