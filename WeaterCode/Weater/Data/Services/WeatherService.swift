//
//  WeatherService.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import Foundation

import Foundation

class WeatherService: WeatherServiceProtocol {
    private let apiKey = AppConfig.apiKey
    private let host = AppConfig.apiHost
    private let baseURL = "https://open-weather13.p.rapidapi.com"
    
    /// Realiza una solicitud a la API para obtener datos del clima.
    /// - Parameter city: Nombre de la ciudad para la búsqueda.
    /// - Returns: Un objeto `WeatherDTO` con los datos del clima.
    func fetchWeather(city: String) async throws -> WeatherDTO {
        // Construimos la URL de la API
        guard let url = URL(string: "\(baseURL)/city/\(city)/EN") else {
            throw URLError(.badURL)
        }
        
        // Configuramos el request con los headers necesarios
        var request = URLRequest(url: url)
        print("Url de consumo: \(url)")
        request.addValue(apiKey, forHTTPHeaderField: "x-rapidapi-key")
        request.addValue(host, forHTTPHeaderField: "x-rapidapi-host")
        
        // Realizamos la solicitud utilizando URLSession
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Validamos la respuesta del servidor
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        // Decodificamos la respuesta al modelo `WeatherResponse`
        let weatherResponse = try JSONDecoder().decode(Weather.self, from: data)
        
        // Convertimos `WeatherResponse` al DTO `WeatherDTO`
        return weatherResponse.toDTO()
    }
}
