//
//  ContentView.swift
//  NewsAPI
//
//  Created by Tunde on 08/02/2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var viewModel: ArticleViewModelImpl = ArticleViewModelImpl(service: ArticleServiceImpl())
    @StateObject var locationManager = LocationManager()
    @State var selected = 0
    let date = Date()
    let screenSize: CGRect = UIScreen.main.bounds
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error) {
                    self.viewModel.getArticles()
                }
            case .success(let content):
                GeometryReader { g in
                    TabView {
                        VStack {
                            MenuPage()
                            NewsStories(contents: content)
                        }.tabItem {
                            Label("News", systemImage: "newspaper")
                        }
                    }
                }
            }
        }
        .onAppear {
            self.viewModel.getArticles()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct MenuPage : View {
    @State var selected = 0
    let date = Date()
    var body : some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 20, height: 20)
                Text("Bulletin News")
                Spacer()
                
            }.padding(.bottom, 40)
            HStack {
                Text(date, style: .date)
                Spacer()
            }
            HStack {
                Text("Welcome back")
                    .lineLimit(2)
                    .font(.system(size: 30).bold())
                Spacer()
            }
        }
        .padding()
        .foregroundColor(Color("DarkLight"))
    }
}

struct NewsStories : View {
    @Environment(\.openURL) var openURL
    let contents: [Article]
    var body: some View {
        ScrollView {
            VStack {
                MainAriticleView(article: contents[1])
                    .onTapGesture {
                        load(url: contents[1].url)
                    }
                HStack {
                    Text("Just for you").font(.system(size: 25.0).bold())
                    
                    Spacer()
                    Text("See more").offset(y: 5).foregroundColor(Color("BabyBlue"))
                }.padding(.bottom, 20)
                ForEach(contents[2...]) { article in
                    ArticleView(article: article)
                        .onTapGesture {
                            load(url: article.url)
                        }
                        .padding(.bottom, 5)
                    Divider()
                    
                }
            }
        }
    }
    
    func load(url: String?) {
        guard let url = url,
              let linkUrl = URL(string: url) else {
            return
        }
        openURL(linkUrl)
    }
}
