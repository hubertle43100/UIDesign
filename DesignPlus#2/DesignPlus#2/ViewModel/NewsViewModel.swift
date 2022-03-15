//
//  NewsViewModel.swift
//  DesignPlus#2
//
//  Created by Hubert Le on 3/10/22.
//

import Foundation
import Combine

//Note: use protocol to make our classes less coupled
protocol NewsViewModel {
    func getArticles()
}

//Note: use class to make the class observable
class NewsViewModelImplement: ObservableObject, NewsViewModel {
    
    private let service: NewsService
    
    private(set) var articles = [Article]() //About: array to hold articles & set = protect it within the class but can you use it in other places
    private var cancellables = Set<AnyCancellable>() //About: Store it in memory & holds your request
    
    //@Published = listen for when state changes
    @Published private(set) var state: ResultState = .loading //About: Use enums to push the data to the frontend
    
    //About: Injected service into the class -> to retrieve articles
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() { //call services to trigger API call
        
        self.state = .loading //double check to make sure the state is loading
        
        let cancellable = service
            .request(from: .getNews)
        
        // listen for completion (Success/Fail) & when it is finishing publishing
            .sink { res in
                switch res {
                    
                case .finished: //Send back the articles
                    self.state = .success(content: self.articles)
                case .failure(let error): //Send back the error
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in //when we get value from the request put in article array
                self.articles = response.articles
            }

        //hold cancellable in memory -> use cancellable and insert it in the Set
        self.cancellables.insert(cancellable)
    }
}
