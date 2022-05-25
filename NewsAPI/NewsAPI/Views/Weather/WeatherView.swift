//
//  WeatherView.swift
//  NewsAPI
//
//  Created by Hubert Le on 5/18/22.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .leading) {
                        VStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(weather.name)
                                    .bold()
                                    .font(.title)
                                
                                if #available(iOS 15.0, *) {
                                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                                        .fontWeight(.light)
                                } else {
                                    // Fallback on earlier versions
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            VStack {
                                HStack {
                                    VStack(spacing: 20) {
                                        Image(systemName: "cloud")
                                            .font(.system(size: 40))
                                        
                                        Text("\(weather.weather[0].main)")
                                    }
                                    .frame(width: 150, alignment: .leading)
                                    
                                    Spacer()
                                    
                                    Text(weather.main.feelsLike.roundDouble() + "°")
                                        .font(.system(size: 100))
                                        .fontWeight(.bold)
                                        .padding()
                                }
                                
                                Spacer()
                                
                                Image("City")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 350)
                                
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack {
                            Spacer()
                            if #available(iOS 15.0, *) {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("Weather now")
                                        .bold()
                                        .padding(.bottom)
                                    
                                    HStack {
                                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°")))
                                        Spacer()
                                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                                    }
                                    
                                    HStack {
                                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                                        Spacer()
                                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .padding(.bottom, 20)
                                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                                .background(.white)
                                .cornerRadius(20, corners: [.topLeft, .topRight])
                            } else {
                                // Fallback on earlier versions
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.bottom)
                    .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .preferredColorScheme(.dark)
        }
    }
}

struct SunnyView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
