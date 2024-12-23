//
//  WeaterApp.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import SwiftUI

@main
struct WeaterApp: App {
    init() {
        print("API Key: \(AppConfig.apiKey)")
        print("API Host: \(AppConfig.apiHost)")
        print("API Base URL: \(AppConfig.baseURL)")
    }
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: WeatherViewModel(
                //MARK: Servicio
                weatherService: WeatherService(),
                //MARK: Almacenamiento en userDefaults
                weatherStorage: PersistentWeatherStorage(dataSource: UserDefaultWeatherDataSource()
                                                        )
            ))
        }
    }
}
