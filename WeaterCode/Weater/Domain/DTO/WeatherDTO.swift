//
//  WeatherDTO.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import Foundation
struct WeatherDTO: Codable, Identifiable {
    var id = UUID()
    let cityName: String
    let latitude: Double
    let longitude: Double
    let temperature: Double
    let feelsLike: Double
    let temperatureMin: Double
    let temperatureMax: Double
    let pressure: Int
    let humidity: Int
    let weatherDescription: String
    let windSpeed: Double
    let windDirection: Int
    let cloudsCoverage: Int
    let queryDate: String
}
