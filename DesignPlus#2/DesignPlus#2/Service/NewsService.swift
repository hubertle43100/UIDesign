//
//  NewsService.swift
//  DesignPlus#2
//
//  Created by Hubert Le on 3/2/22.
//

import Foundation
import Combine

protocol NewsService { //Note: use protocol again to make it as testable as possible
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse,APIError>
}

struct NewsServiceImplement: NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError> {
        return URLSession
            .shared
        
        //About: listen to the results of the service to publish a value
            .dataTaskPublisher(for: endpoint.urlRequest)
        
        //About: get urlRequest put it on the main thread to not cause out of sync (UPDATE)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown}
        
        //About: flatten everything we get from the API
            .flatMap { data, response -> AnyPublisher<NewsResponse, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                //Start to decode the object if conditions are met
                if (200...299).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dataDecodingStrategy = .base64 //.iso8601 was used here
                    return Just(data)
                        .decode(type: NewsResponse.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.DecodingError}.eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
        
        //Converts values to generic publisher to read values
            .eraseToAnyPublisher()
    }
}

// MARK: - Pattern
//1. initalizing something to rake & read data coming in
//2. Execute and organize data
//3. Map error in the case where something goes wrong
