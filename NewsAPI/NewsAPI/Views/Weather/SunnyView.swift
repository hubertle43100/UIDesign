//
//  SunnyView.swift
//  NewsAPI
//
//  Created by Hubert Le on 5/19/22.
//

import SwiftUI

struct SunnyView: View {
    var weather: ResponseBody
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SunnyView_Previews: PreviewProvider {
    static var previews: some View {
        SunnyView(weather: previewWeather)
    }
}
