//
//  MockWeatherService.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import Foundation

import Foundation

class MockWeatherService: WeatherServiceProtocol {
    private let mockFileName: String
    
    /// Inicializa el servicio con el nombre del archivo mock.
    /// - Parameter mockFileName: Nombre del archivo JSON (sin extensión).
    init(mockFileName: String = "mockService") {
        self.mockFileName = mockFileName
    }
    
    /// Simula la obtención de datos del clima desde un archivo JSON.
    /// - Parameter city: Nombre de la ciudad (se ignora en el mock).
    /// - Returns: Un objeto `WeatherDTO` con datos simulados.
    func fetchWeather(city: String) async throws -> WeatherDTO {
        // Obtiene la URL del archivo JSON en el bundle
        guard let url = Bundle.main.url(forResource: mockFileName, withExtension: "json") else {
            throw URLError(.fileDoesNotExist)
        }
        
        // Carga el contenido del archivo
        let data = try Data(contentsOf: url)
        
        // Decodifica el JSON en el modelo `WeatherResponse`
        let weatherResponse = try JSONDecoder().decode(Weather.self, from: data)
        
        // Convierte `WeatherResponse` a `WeatherDTO`
        return weatherResponse.toDTO()
    }
}
