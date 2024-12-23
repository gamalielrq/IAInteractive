//
//  AlertType.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 22/12/24.
//

import Foundation
import SwiftUI

enum AlertType {
    case error
    case warning
    case success
    
    var color: Color {
        switch self {
        case .error:
            return Color.red
        case .warning:
            return Color.yellow
        case .success:
            return Color.green
        }
    }
    
    var icon: String {
        switch self {
        case .error:
            return "xmark.octagon"
        case .warning:
            return "exclamationmark.triangle"
        case .success:
            return "checkmark.circle"
        }
    }
}
