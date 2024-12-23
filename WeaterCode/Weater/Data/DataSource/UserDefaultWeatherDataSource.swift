//
//  UserDefaultWeatherDataSource.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 22/12/24.
//

import Foundation

class UserDefaultWeatherDataSource: WeatherDataSource {
    private let storageKey = "savedWeather"
    
    func saveWeather(_ weather: WeatherDTO) {
        var savedWeather = fetchSavedWeather()
        savedWeather.append(weather)
        
        if let encoded = try? JSONEncoder().encode(savedWeather) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
    
    func fetchSavedWeather() -> [WeatherDTO] {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let decoded = try? JSONDecoder().decode([WeatherDTO].self, from: data) else {
            return []
        }
        return decoded
    }
    
    func deleteAllWeather() {
        UserDefaults.standard.removeObject(forKey: storageKey)
    }
}
