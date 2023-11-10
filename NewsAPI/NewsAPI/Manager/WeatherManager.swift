//
//  WeatherManager.swift
//  NewsAPI
//
//  Created by Hubert Le on 5/19/22.
//

import Foundation
import CoreLocation

class WeatherManager: ObservableObject {
    // HTTP request to get the current weather depending on the coordinates we got from LocationManager
    @available(iOS 15.0, *)
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        // Replace YOUR_API_KEY in the link below with your own
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=468f54456bc7af6dd975b3cb3519fbe3&units=imperial") else { fatalError("Missing URL") }


        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Decodable {
        let cod: String
        let message: Int
        let cnt: Int
        let list: [WeatherInfo]
        let city: City


    struct WeatherInfo: Codable {
        let dt: Int
        let main: Main
        let weather: [Weather]
        let clouds: Clouds
        let wind: Wind
        let visibility: Int
        let pop: Double
        let sys: Sys
        let dt_txt: String
    }

    struct Main: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Int
        let sea_level: Int
        let grnd_level: Int
        let humidity: Int
        let temp_kf: Double
    }

    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }

    struct Clouds: Codable {
        let all: Int
    }

    struct Wind: Codable {
        let speed: Double
        let deg: Int
        let gust: Double
    }

    struct Sys: Codable {
        let pod: String
    }

    struct City: Codable {
        let id: Int
        let name: String
        let coord: Coord
        let country: String
        let population: Int
        let timezone: Int
        let sunrise: Int
        let sunset: Int
    }

    struct Coord: Codable {
        let lat: Double
        let lon: Double
    }
}

extension ResponseBody.Main {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}


