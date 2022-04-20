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
                        ZStack {
                            VStack {
                                Color("BabyBlue").ignoresSafeArea()
                                Color("Matgray")
                            }
                            VStack {
                                MenuPage()
                                GeometryReader{_ in
                                    SegmentedControl(selected: $selected)
                                    if self.selected == 0 {
                                        ScrollView (.horizontal, showsIndicators: false) {
                                                HStack {
                                                    ForEach(content[1...3]) { article in
                                                        MainAriticleView(article: article)
                                                            .onTapGesture {
                                                                load(url: article.url)
                                                            }
                                                    }
                                                        .frame(width: g.size.width, height: g.size.height - 300, alignment: .center)
                                                }
                                        }.offset(y:40)
                                        
                                    }
                                    else {
                                        List(content[4...]) { article in
                                            ArticleView(article: article)
                                                .onTapGesture {
                                                    load(url: article.url)
                                                }
                                        }
                                        .offset(x:-16,y:70)
                                        .frame(width: g.size.width, height: g.size.height - 50, alignment: .center)
                                    }
                                }
                                .padding()
                            }
                            .tabItem {
                                Label("Weather", systemImage: "cloud")
                            }
                        }
                        VStack {
                            if let location = locationManager.location {
                                Text("Your coordinates are: \(location.longitude),\(location.latitude)")
                            } else {
                                if locationManager.isLoading {
                                    ProgressView()
                                } else {
                                    LocationView().environmentObject(locationManager)
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
                Text("Feeds").frame(width: 190, height: 30)
                    .background(self.selected == 0 ? .white : Color(#colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)))
                    .clipShape(Capsule())
            }.foregroundColor(.black)
            Button(action: {
                self.selected = 1
            }) {
                Text("Popular").frame(width: 190, height: 30)
                    .background(self.selected == 1 ? .white : Color(#colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)))
                    .clipShape(Capsule())
            }.foregroundColor(.black)
        }.padding(8).background(Color(#colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)))
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
