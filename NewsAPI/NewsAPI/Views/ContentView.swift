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
    @State private var tabSelection = 0
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
                    TabView (selection: $tabSelection) {
                        MenuPage(contents: content, tabSelection: $tabSelection)
                            .tag(0)
                            .tabItem {
                                Label("News", systemImage: "newspaper")
                            }
                        VStack {
                            MainAriticleView(article: content[0])
                        }.tag(1)
                            .tabItem {
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
struct MenuPage : View {
    let date = Date()
    let contents: [Article]
    @Binding var tabSelection: Int
    @State private var isSheetPresented = false
    
    var body : some View {
        VStack {
            VStack{
                Text("Bulletin").bold() + Text("News").foregroundColor(Color("SeaGreen")).bold()
                HStack {
                    VStack {
                        HStack {
                            Text("Welcome")
                                .font(.system(size: 32).bold())
                            Spacer()
                        }
                        HStack {
                            Text(getFormattedDate())
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                            Spacer()
                        }
                    }
                    Spacer()
                    HStack {
                        Text("64°F")
                            .font(.system(size: 18,weight: .semibold))
                        Image(systemName: "cloud.sun")
                            .font(.system(size: 18).bold())
                    }.padding()
                        .background(Color("TeaGreen"))
                        .cornerRadius(50)
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
                                        ForEach(0..<10) {_ in
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
                }.padding()
            }
           
            NewsStories(contents: contents, tabSelection: $tabSelection)
        }
        .foregroundColor(Color("DarkLight"))
    }
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        return dateFormatter.string(from: date)
    }
}



@available(iOS 15.0, *)
struct NewsStories : View {
    @StateObject var viewModel: ArticleViewModelImpl = ArticleViewModelImpl(service: ArticleServiceImpl())
    @Environment(\.openURL) var openURL
    let contents: [Article]
    @Binding var tabSelection: Int
    var body: some View {
        ScrollView {
            VStack {
                MainAriticleView(article: contents[0])
                    .onTapGesture {
                        load(url: contents[0].url)
                    }
                Button(action: {
                    //Do something here
                    self.tabSelection = 1
                }) {
                    Text("See the full story here")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color.primary)
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        .background(Color("TeaGreen"))
                    
                }
                .cornerRadius(50)
                .frame(maxWidth: UIScreen.main.bounds.width - 30)
                HStack {
                    Text("Just for you").font(.system(size: 25.0).bold())
                    Spacer()
                }.padding()
                ForEach(contents[2...]) { article in
                    if article.title != "[Removed]" {
                        ArticleView(article: article)
                            .onTapGesture {
                                load(url: article.url)
                            }
                            .padding(.bottom, 5)
                        Divider()
                    }
                    
                    
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
