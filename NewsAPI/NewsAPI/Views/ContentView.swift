//
//  ContentView.swift
//  NewsAPI
//
//  Created by Tunde on 08/02/2021.
//

import SwiftUI
import Combine

@available(iOS 16.0, *)
struct ContentView: View {
    @StateObject var viewModel: ArticleViewModelImpl = ArticleViewModelImpl(service: ArticleServiceImpl())
    @StateObject var locationManager = LocationManager()
    @State var selected = 0
    let date = Date()
    let screenSize: CGRect = UIScreen.main.bounds
    
    @available(iOS 16.0, *)
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

@available(iOS 16.0, *)
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

@available(iOS 16.0, *)
struct MenuPage : View {
    @State var selected = 0
    let date = Date()
    @State private var isSheetPresented = false
    
    var body : some View {
        VStack {
            Text("Bulletin News")
            HStack {
                Text("Welcome back")
                    .lineLimit(2)
                    .font(.system(size: 32).bold())
                Spacer()
                Text("64°F")
                    .font(.system(size: 24).bold())
                Image(systemName: "cloud.sun")
                    .font(.system(size: 24).bold())
                    .scaledToFit()
                    .frame(width: 44, height: 44) // Adjust the size as needed
                    .onTapGesture {
                        isSheetPresented.toggle()
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("64°F")
                                        .font(.system(size: 48, weight: .semibold))
                                    Text("San Jose")
                                }.padding(.leading)
                                Spacer()
                                Image(systemName: "cloud.sun")
                                    .font(.system(size: 48))
                                    .scaledToFit()
                                    .frame(width: 64, height: 64)
                                    .padding()
                            }
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(0..<7) {_ in
                                        VStack {
                                            Text("Tue").padding(.bottom, 1)
                                            Image(systemName: "cloud.sun")
                                                .font(.system(size: 24).bold())
                                                .scaledToFit()
                                                .padding(.bottom, 1)
                                            Text("64°F")
                                        }.padding(.trailing)
                                        
                                    }
                                    
                                }.padding()
                                
                            }
                            Spacer()
                        }.padding(.top, 24).presentationDetents([.fraction(0.30)])
                    }
            }
            HStack {
                Text(date, style: .date)
                    .font(.system(size: 16))
                Spacer()
            }
        }
        .padding()
        .foregroundColor(Color("DarkLight"))
    }
}

@available(iOS 16.0, *)
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}







@available(iOS 15.0, *)
struct NewsStories : View {
    @StateObject var viewModel: ArticleViewModelImpl = ArticleViewModelImpl(service: ArticleServiceImpl())
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
                }.padding()
                ForEach(contents[2...]) { article in
                    if article.title != "[Removed]" {
                        ArticleView(article: article)
                            .onTapGesture {
                                load(url: article.url)
                            }
                            .padding(.bottom, 5)
                    }
                    Divider()
                    
                }
            }
        }.refreshable {
            self.viewModel.refreshArticles()
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
