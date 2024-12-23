//
//  HistoryItem.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import Foundation

struct HistoryItem: Codable, Identifiable {
    let id: UUID
    let date: Date
    let weather: Weather
}
