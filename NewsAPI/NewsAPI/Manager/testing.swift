import SwiftUI
import CoreLocation

struct ContentView1: View,  {
    @State private var userLocation: CLLocation?
    @State private var weatherData: ResponseBody?
    @State private var isAlertPresented = false

    var body: some View {
        VStack {
            Text("Get Weather")
                .onTapGesture {
                    requestLocation()
                }
                .alert(isPresented: $isAlertPresented) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Failed to get location or weather data."),
                        dismissButton: .default(Text("OK"))
                    )
                }

            if let weatherData = weatherData {
                Text("Temperature: \(weatherData.main.temp) °F")
            }
        }
    }

    private func requestLocation() {
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        } else {
            isAlertPresented = true
        }
    }

    private func fetchWeatherData() {
        guard let latitude = userLocation?.coordinate.latitude,
              let longitude = userLocation?.coordinate.longitude else {
            isAlertPresented = true
            return
        }

        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=YOUR_API_KEY&units=imperial") else {
            fatalError("Missing URL")
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(WeatherData.self, from: data)
                    DispatchQueue.main.async {
                        self.weatherData = decodedData
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}
