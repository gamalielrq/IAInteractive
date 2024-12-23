//
//  JsonWeatherDataSource.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 22/12/24.
//

import Foundation

class JsonWeatherDataSource: WeatherDataSource {
    private let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func saveWeather(_ weather: WeatherDTO) {
        // No implementado para lectura desde archivo
        print("La operacion de guardado no esta soportada para los archivos JSON.")
    }
    
    func fetchSavedWeather() -> [WeatherDTO] {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode([WeatherDTO].self, from: data) else {
            return []
        }
        return decoded
    }
    func deleteAllWeather() {
        // No implementado para lectura desde archivo
        print("La operacion de eliminacion no esta soportada para los archivos JSON.")
    }
        
}
