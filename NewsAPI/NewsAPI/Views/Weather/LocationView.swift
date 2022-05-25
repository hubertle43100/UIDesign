//
//  LocationView.swift
//  NewsAPI
//
//  Created by Hubert Le on 5/19/22.
//

import SwiftUI


@available(iOS 15.0, *)
struct LocationView: View {
    // Replace YOUR_API_KEY in WeatherManager with your own API key for the app to work
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    @available(iOS 15.0, *)
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let location = location {
                    if let weather = weather {
                        WeatherView(weather: weather)
                    } else {
                        LoadingView()
                            .task {
                                do {
                                    weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                } catch {
                                    print("Error getting weather: \(error)")
                                }
                            }
                    }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

@available(iOS 15.0, *)
struct LocationView_Previews: PreviewProvider {
    @available(iOS 15.0, *)
    static var previews: some View {
        LocationView()
    }
}
