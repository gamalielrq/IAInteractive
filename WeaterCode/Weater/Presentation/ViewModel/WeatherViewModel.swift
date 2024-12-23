//
//  WeatherViewModel.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherDTO?
    @Published var errorMessage: String?
    
    @Published var savedWeather: [WeatherDTO] = []
    
    private let weatherService: WeatherServiceProtocol
    private let weatherStorage: WeatherStorageProtocol
    
    
    init(weatherService: WeatherServiceProtocol, weatherStorage: WeatherStorageProtocol) {
        self.weatherService = weatherService
        self.weatherStorage = weatherStorage
        
        self.savedWeather = weatherStorage.fetchSavedWeather()
    }
    
    func fetchWeather(city: String) async {
        do {
            let fetchedWeather = try await weatherService.fetchWeather(city: city)
            weather = fetchedWeather
            // Guardar los datos localmente
            weatherStorage.saveWeather(fetchedWeather)
            
            // Actualizar la lista de datos guardados
            savedWeather = weatherStorage.fetchSavedWeather()
        } catch {
            errorMessage = error.localizedDescription
            print("Erro en el servicio \(errorMessage ?? "Error")")
        }
    }
    
    func isMockService() -> Bool {
        return weatherService is MockWeatherService
    }
    
    func getSavedWeather() -> [WeatherDTO] {
        return savedWeather
    }
    
    func deleteAllWeather() {
        weatherStorage.deleteAllWeather()
        savedWeather = []
    }
}
