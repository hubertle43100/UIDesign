//
//  ContentView.swift
//  NewsAPI
//
//  Created by Tunde on 08/02/2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    @Environment(\.openURL) var openURL
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
                            ZStack {
                                VStack {
                                    Color("BabyBlue").ignoresSafeArea().frame(height: screenSize.height * 0.33)
                                    Color("LightDark").ignoresSafeArea()
                                }
                                VStack {
                                    MenuPage()
                                    GeometryReader{_ in
                                        SegmentedControl(selected: $selected)
                                        if self.selected == 0 {
                                            ScrollView {
                                                VStack {
                                                    ScrollView (.horizontal, showsIndicators: false) {
                                                            HStack {
                                                                ForEach(content[1...3]) { article in
                                                                    MainAriticleView(article: article)
                                                                        .onTapGesture {
                                                                            load(url: article.url)
                                                                        }
                                                                    Divider()
                                                                }
                                                            }
                                                    }.padding(.bottom, 30)
                                                    HStack {
                                                        Text("Just for you").font(.system(size: 25.0).bold())
                                                        
                                                        Spacer()
                                                        Text("See more").offset(y: 5).foregroundColor(Color("BabyBlue"))
                                                    }.padding(.bottom, 20)
                                                    ForEach(content[4...]) { article in
                                                        ArticleView(article: article)
                                                            .onTapGesture {
                                                                load(url: article.url)
                                                            }
                                                            .padding(.bottom, 5)
                                                        Divider()
                                                            
                                                    }
                                                }
                                            }.offset(y:100)
                                        }
                                        else {
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                        .tabItem {
                            Label("News", systemImage: "newspaper")
                        }
                        VStack {
                            if let location = locationManager.location {
                                Text("Your coordinates are: \(location.longitude),\(location.latitude)")
                            } else {
                                if locationManager.isLoading {
                                    ProgressView()
                                } else {
                                    if #available(iOS 15.0, *) {
                                        LocationView().environmentObject(locationManager)
                                    } else {
                                        // Fallback on earlier versions
                                    }
                                }
                            }
                        }.tabItem {
                            Label("Weather", systemImage: "cloud.sun")
                        }
                    }
                }
            }
        }
        .onAppear {
            self.viewModel.getArticles()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SegmentedControl : View {
    @Binding var selected : Int
    
    var body : some View {
        HStack {
            Button(action: {
                self.selected = 0
            }) {
                Text("Feeds")
                    .frame(width: 65, height: 25)
                    .padding(.vertical,12)
                    .padding(.horizontal, 30)
                    .background(self.selected == 0 ? .white : Color("Matgray"))
                    .clipShape(Capsule())
            }.foregroundColor(.black)
            Button(action: {
                self.selected = 1
            }) {
                Text("Popular")
                    .frame(width: 65, height: 25)
                    .padding(.vertical,12)
                    .padding(.horizontal, 30)
                    .background(self.selected == 1 ? .white : Color("Matgray"))
                    .clipShape(Capsule())
            }.foregroundColor(.black)
        }.padding(5)
            .background(Color("Matgray"))
            .clipShape(Capsule())
        
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
                
            }.padding(.bottom, 20)
            HStack {
                Text(date, style: .date)
                Spacer()
            }
            HStack {
                Text("Welcome back,\nViewer")
                    .lineLimit(2)
                    .font(.system(size: 40).bold())
                Spacer()
            }
        }
        .padding()
        .foregroundColor(.white)
    }
}
