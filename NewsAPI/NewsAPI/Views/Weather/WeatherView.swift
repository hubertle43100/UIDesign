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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SunnyView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
