//
//  ContentView.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var path: [Route] = []
    @StateObject private var viewModel: WeatherViewModel
    @State private var showToast: Bool = false
    @State private var toastMsg: String = ""
    @State private var alertType: AlertType = .warning
    @State private var isLoading: Bool = false
    
    init(viewModel: WeatherViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                VStack(spacing: 20) {
                    Button("Mostrar mapa") {
                        guard let weather = viewModel.weather, !viewModel.getSavedWeather().isEmpty else {
                            showToast(message: "El servicio aún no se ha ejecutado.", type: .warning)
                            return
                        }
                        let coordinate = Coordinate(latitude: weather.latitude, longitude: weather.longitude)
                        print("Mostrar mapa con coordenadas: \(coordinate.latitude), \(coordinate.longitude)")
                        path.append(.map(coordinate: coordinate, cityName: weather.cityName))
                    }
                    
                    Button("Other Fragment") {
                        if !viewModel.getSavedWeather().isEmpty {
                            path.append(.history)
                        } else {
                            showToast(message: "No hay resultados disponibles.", type: .error)
                        }
                    }
                    
                    Button("Ejecutar servicio") {
                        Task {
                            isLoading = true
                            
                           await viewModel.fetchWeather(city: "Mexico")
                            
                            if viewModel.isMockService() {
                                let startTime = Date()
                                let elapsedTime = Date().timeIntervalSince(startTime)
                                let minDelay: TimeInterval = 2.0
                                
                                if elapsedTime < minDelay {
                                    try? await Task.sleep(nanoseconds: UInt64((minDelay - elapsedTime) * 1_000_000_000))
                                }
                            }
                            
                            isLoading = false
                            if let errorMessage = viewModel.errorMessage {
                                showToast(message: errorMessage, type: .error)
                            } else if viewModel.weather != nil {
                                showToast(message: "Datos cargados.", type: .success)
                            }
                        }
                    }
                    
                }
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .map(let coordinate, let cityName):
                        MapsView(coordinate: coordinate, cityName: cityName)
                    case .history:
                        HistoryView(viewModel: viewModel, path: $path)
                    }
                }
                .navigationTitle("Menú principal")
            }
        }.overlay(
            Group {
                if isLoading {
                    ZStack {
                        ProgressView("Cargando información ...")
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                    }
                }
            }
        )
        .toast(isPresented: $showToast, message: toastMsg, type: alertType)
        .padding()
        .allowsHitTesting(!isLoading)
        .allowsHitTesting(!showToast)
    }
    
    // Método para mostrar el Toast
    private func showToast(message: String, type: AlertType) {
        toastMsg = message
        alertType = type
        showToast = true
    }
}

#Preview {
    ContentView(viewModel: WeatherViewModel(
        //Inyeccion de mock de respuesta del servicio
        weatherService: MockWeatherService(),
        //Inyeccion el mock de consultas guardadas solo para efectos de visualizacion de los fragmentos
        //weatherStorage: PersistentWeatherStorage(dataSource: JsonWeatherDataSource(fileName: "StorageServiceMock"))
        weatherStorage: PersistentWeatherStorage(dataSource: UserDefaultWeatherDataSource())
    ))
}
