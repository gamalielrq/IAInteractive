//
//  MapsView.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import SwiftUI
import MapKit

struct MapsView: View {
    var name: String = ""
    let coordinate: Coordinate
    
    @State private var mapRegion: MKCoordinateRegion
    @Environment(\.dismiss) private var dismiss
    
    init(coordinate: Coordinate, cityName: String) {
        self.coordinate = coordinate
        self.name = cityName
        _mapRegion = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        ))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                VStack(alignment: .center, spacing: 5) {
                    Text("Ciudad: \(name)")
                        .font(.headline)
                    HStack {
                        Text("Latitud: \(coordinate.latitude)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    HStack {
                        Text("Longitud: \(coordinate.longitude)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                
                Map(coordinateRegion: $mapRegion, annotationItems: [coordinate]) { item in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(Color.red)
                            .scaleEffect(2)
                    }
                }
            }
        }.navigationBarTitleDisplayMode(.inline)
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
            }
    }
}

#Preview {
    MapsView(coordinate: Coordinate(latitude: 30.438, longitude: -89.1028), cityName: "San Francisco")
}

