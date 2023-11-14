//
//  NewsAPIApp.swift
//  NewsAPI
//
//  Created by Hubert Le on 08/02/2021.
//

import SwiftUI

@available(iOS 16.0, *)
@main
struct NewsAPIApp: App {
    @AppStorage("hasShownLocationPermissionAlert") private var hasShownLocationPermissionAlert = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .alert(isPresented: $hasShownLocationPermissionAlert) {
                    Alert(
                        title: Text("Allow access to your location?"),
                        message: Text("We need access to your location for some features."),
                        primaryButton: .default(
                            Text("Allow"),
                            action: {
                                // Handle location permission and update UserDefaults
                                // ...
                                
                                hasShownLocationPermissionAlert = true
                            }
                        ),
                        secondaryButton: .cancel(
                            Text("Deny"),
                            action: {
                                // Handle denying location permission
                                // ...
                                
                                hasShownLocationPermissionAlert = true
                            }
                        )
                    )
                }
            
        }
    }
}
