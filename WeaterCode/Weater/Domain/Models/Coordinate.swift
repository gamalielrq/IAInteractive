//
//  Coordinate.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import Foundation

struct Coordinate: Codable, Identifiable, Hashable {
    var id = UUID()
    let latitude: Double
    let longitude: Double
}
