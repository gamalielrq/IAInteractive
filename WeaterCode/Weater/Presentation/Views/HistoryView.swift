//
//  HistoryView.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import Foundation
import SwiftUI

struct HistoryView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: WeatherViewModel
    @Binding var path: [Route]
    @State private var showAlert: Bool = false
    @State private var showToast: Bool = false
    @State private var toastMessage: String  = ""
    
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.getSavedWeather()) { weather in
                    Button(action: {
                        let coordinate = Coordinate(latitude: weather.latitude, longitude: weather.longitude)
                        path.append(.map(coordinate: coordinate, cityName: weather.cityName))
                    }) {
                        VStack(alignment: .center, spacing: 5) {
                            Text("Ciudad: \(weather.cityName)")
                                .font(.headline)
                            
                            HStack {
                                VStack (alignment: .leading){
                                    
                                    HStack {
                                        Text("Latitud: \(weather.latitude)")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    HStack {
                                        Text("Longitud: \(weather.longitude)")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    Text("Fecha de cosulta: \(weather.queryDate)")
                                        .font(.footnote)
                                        .foregroundColor(.primary)
                                }
                                Spacer()
                                Image(systemName: "location.circle.fill")
                                    .foregroundColor(.blue)
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                }
            }
            .toast(isPresented: $showToast, message: toastMessage, type: .success)
            .allowsHitTesting(!showToast)
            
        }.navigationDestination(for: Route.self) { route in
            switch route {
            case .map(let coordinate, let cityName):
                MapsView(coordinate: coordinate, cityName: cityName)
            case .history:
                EmptyView()
            }
        }
        .navigationTitle("Historial del servicio")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Regresar")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAlert = true
                    }) {
                            Image(systemName: "trash")
                    }
                }
            }
            .alert("Confirmar acción", isPresented: $showAlert) {
                Button("Cancelar", role: .cancel, action: {})
                Button("Borrar todo", role: .destructive) {
                    viewModel.deleteAllWeather()
                    toastMessage = "Todos los elementos fueron borrados"
                    withAnimation {
                        showToast = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            showToast = false
                            dismiss()
                        }
                    }
                }
            } message: {
                Text("¿Estás seguro de que deseas borrar todos los elementos?")
            }
            
    }
}
