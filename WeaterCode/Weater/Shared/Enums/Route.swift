//
//  Route.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 22/12/24.
//

import Foundation

enum Route: Hashable {
    case map(coordinate: Coordinate,
             cityName: String)
    case history
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.map(let lhsCoordinate, let lhsCityName), .map(let rhsCoordinate, let rhsCityName)):
            return lhsCoordinate == rhsCoordinate && lhsCityName == rhsCityName
        case (.history, .history):
            return true
        default:
            return false
        }
    }
}
