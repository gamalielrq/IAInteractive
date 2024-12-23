//
//  WeatherServiceProtocol.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchWeather(city: String) async throws -> WeatherDTO
}
