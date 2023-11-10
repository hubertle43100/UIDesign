//
//  LocationManager.swift
//  NewsAPI
//
//  Created by Hubert Le on 4/6/22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    // Creating an instance of CLLocationManager, the framework we use to get the coordinates
    let locationManager = CLLocationManager()
    
    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var coordinate: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        
        // Assigning a delegate to our CLLocationManager instance
        locationManager.delegate = self
    }
    
    // Requests the one-time delivery of the user’s current location
    func requestLocation() {
        isLoading = true
        locationManager.requestLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                // Insert code here of what should happen when Location services are authorized
                authorizationStatus = .authorizedWhenInUse
                locationManager.requestLocation()
                break
                
            case .restricted:  // Location services currently unavailable.
                // Insert code here of what should happen when Location services are NOT authorized
                authorizationStatus = .restricted
                break
                
            case .denied:  // Location services currently unavailable.
                // Insert code here of what should happen when Location services are NOT authorized
                authorizationStatus = .denied
                break
                
            case .notDetermined:        // Authorization not determined yet.
                authorizationStatus = .notDetermined
                manager.requestWhenInUseAuthorization()
                break
                
            default:
                break
            }
        }
    
    // Set the location coordinates to the location variable
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.coordinate = location.coordinate
        }
        isLoading = false
    }
    
    
    // This function will be called if we run into an error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}
