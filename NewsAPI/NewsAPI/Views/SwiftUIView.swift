//
//  SwiftUIView.swift
//  NewsAPI
//
//  Created by Hubert Le on 4/6/22.
//

import SwiftUI
import CoreLocationUI

struct SwiftUIView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the Weather App")
                    .bold()
                    .font(.title)
                
                Text("Please share your current location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            
            // LocationButton from CoreLocationUI framework imported above, allows us to requestionLocation
            if #available(iOS 15.0, *) {
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
            } else {
                // Fallback on earlier versions
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
