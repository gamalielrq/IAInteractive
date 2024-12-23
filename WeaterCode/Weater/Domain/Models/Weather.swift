//
//  Weather.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import Foundation

import Foundation

struct Weather: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
    
    struct Coord: Codable {
        let lon: Double
        let lat: Double
    }
    
    struct Weather: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    struct Main: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Int
        let humidity: Int
        let sea_level: Int?
        let grnd_level: Int?
    }
    
    struct Wind: Codable {
        let speed: Double
        let deg: Int
    }
    
    struct Clouds: Codable {
        let all: Int
    }
    
    struct Sys: Codable {
        let type: Int
        let id: Int
        let country: String
        let sunrise: Int
        let sunset: Int
    }
}

extension Weather {
    func toDTO() -> WeatherDTO {
        return WeatherDTO(
            cityName: name,
            latitude: coord.lat,
            longitude: coord.lon,
            temperature: main.temp,
            feelsLike: main.feels_like,
            temperatureMin: main.temp_min,
            temperatureMax: main.temp_max,
            pressure: main.pressure,
            humidity: main.humidity,
            weatherDescription: weather.first?.description ?? "No description available",
            windSpeed: wind.speed,
            windDirection: wind.deg,
            cloudsCoverage: clouds.all,
            queryDate: Date().formatted(as: "MM/dd/yyyy hh:mm a", locale: Locale(identifier: "en_US"))
        )
    }
}
