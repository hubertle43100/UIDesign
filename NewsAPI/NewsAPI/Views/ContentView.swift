//
//  ContentView.swift
//  NewsAPI
//
//  Created by Tunde on 08/02/2021.
//

import SwiftUI
import Combine
import CoreLocation
import CoreLocationUI

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
                                Label("Headline", systemImage: "globe")
                            }
                    }.accentColor(Color("SeaGreen"))
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
    @StateObject var locationManager = LocationManager()
    @State private var weatherData: ResponseBody?
    @State private var isAlertPresented = false
    var weatherManager = WeatherManager()
    
    var next10Days: [Date] = []
    let calendar = Calendar.current
    let today = Date()
    
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
                        if let coordinate = locationManager.coordinate {
                            if let weatherData = weatherData {
                                Text("\(weatherData.list[0].main.feelsLike.roundDouble())°F")
                                    .font(.system(size: 18, weight: .semibold))
                                Image(weatherData.list[0].weather[0].description )
                                    .resizable()
                                            .scaledToFit()
                                            .frame(width: 24, height: 24) // Set the desired size
                                            .padding(.bottom, 1)
                            } else {
                                Text("Loading...")
                                    .task {
                                        do {
                                            weatherData = try await weatherManager.getCurrentWeather(latitude: coordinate.latitude, longitude: coordinate.longitude)
                                        } catch {
                                            print("Error \(error)")
                                        }
                                    }
                            }
                            
                        } else {
                            Text("loading...")
                        }
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
                                        if let coordinate = locationManager.coordinate {
                                            if let weatherData = weatherData {
                                                Text("\(weatherData.list[0].main.feelsLike.roundDouble())°F")
                                                    .font(.system(size: 48, weight: .semibold))
                                                    .padding(.top , 25)
                                                Text(weatherData.city.name)
                                                Text("\(weatherData.list.count)").opacity(0)
                                            } else {
                                                Text("Loading...")
                                                    .task {
                                                        do {
                                                            weatherData = try await weatherManager.getCurrentWeather(latitude: coordinate.latitude, longitude: coordinate.longitude)
                                                        } catch {
                                                            print("Error \(error)")
                                                        }
                                                    }
                                            }
                                        } else {
                                            Text("Loading...")
                                        }
                                    }.padding(.leading)
                                    Spacer()
                                    Image(weatherData?.list[0].weather[0].description ?? "clear sky")
                                        .resizable()
                                                .scaledToFit()
                                                .frame(width: 64, height: 64) // Set the desired size
                                                .padding(.trailing , 30)
                                }
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(0..<10) { i in
                                            VStack {
                                                Text(formatDate(getNextFewDays()[i]))
                                                                        .padding(.bottom, 1)
                                                Image(weatherData?.list[i].weather[0].description ?? "clear sky")
                                                    .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 24, height: 24) // Set the desired size
                                                            .padding(.bottom, 1)
                                                Text("\(weatherData?.list[i].main.feelsLike.roundDouble() ?? "--")°F")
                                            }.padding(.trailing)
                                            
                                        }
                                        
                                    }.padding()
                                    
                                }
                                Spacer()
                            }.padding(.top, 24).presentationDetents([.fraction(0.30)])
                                .background(Color("TeaGreen"))
                        }
                }.padding()
            }
            
            NewsStories(contents: contents, tabSelection: $tabSelection)
        }
        .onAppear {
            locationManager.requestLocation()
        }
        .foregroundColor(Color("DarkLight"))
    }
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: date)
    }
    
    func getNextFewDays() -> [Date] {
        var next10Days: [Date] = []
        let calendar = Calendar.current
        let today = Date()
        
        for dayOffset in 1...10 {
            if let nextDate = calendar.date(byAdding: .day, value: dayOffset, to: today) {
                next10Days.append(nextDate)
            }
        }
        
        return next10Days
    }
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        return dateFormatter.string(from: date)
    }
}

@available(iOS 15.0, *)
struct WeatherView: View {
    let location: CLLocationCoordinate2D
    
    var body: some View {
        // Your weather view code goes here, using the location parameter
        // You can use the WeatherManager to fetch data based on the location
        VStack {
            Text("Weather for \(location.latitude), \(location.longitude)")
            // Add more UI components as needed
        }
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
