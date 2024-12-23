//
//  InMemoryWeatherStorage.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import Foundation

class InMemoryWeatherStorage: WeatherStorageProtocol {
    func deleteAllWeather() {
        storedWeather.removeAll()
    }
    
    private var storedWeather: [WeatherDTO] = []
    
    func saveWeather(_ weather: WeatherDTO) {
        storedWeather.append(weather)
    }
    
    func fetchSavedWeather() -> [WeatherDTO] {
        return storedWeather
    }
}
