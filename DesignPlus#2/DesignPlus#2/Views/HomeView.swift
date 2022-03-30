//
//  HomeView.swift
//  DesignPlus#2
//
//  Created by Hubert Le on 3/29/22.
//

import SwiftUI

struct HomeView: View {
    
    //StateObject = keep things in memory to not lose current object
    @StateObject var viewModel = NewsViewModelImplement(service: NewsServiceImplement())
    
    var body: some View {
        Group {
            
            //check the current state of app
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            case .success(let articles):
                NavigationView {
                    List(articles) { item in
                        Feeds(article: item)
                    }.navigationTitle(Text("News"))
                }
            }
        }.onAppear(perform: viewModel.getArticles)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
