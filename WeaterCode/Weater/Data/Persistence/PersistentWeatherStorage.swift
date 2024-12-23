//
//  PersistentWeatherStorage.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 22/12/24.
//

import Foundation

class PersistentWeatherStorage: WeatherStorageProtocol {
    private let dataSource: WeatherDataSource
    
    init(dataSource: WeatherDataSource) {
        self.dataSource = dataSource
    }
    
    func saveWeather(_ weather: WeatherDTO) {
        dataSource.saveWeather(weather)
    }
    
    func fetchSavedWeather() -> [WeatherDTO] {
        dataSource.fetchSavedWeather()
    }
    
    func deleteAllWeather() {
        dataSource.deleteAllWeather()
    }
}
