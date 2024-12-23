//
//  WeatherDataSource.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 22/12/24.
//

import Foundation

protocol WeatherDataSource {
    func saveWeather(_ weather: WeatherDTO)
    func fetchSavedWeather() -> [WeatherDTO]
    func deleteAllWeather()
}
