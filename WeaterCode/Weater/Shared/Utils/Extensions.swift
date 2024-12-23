//
//  Extensions.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 22/12/24.
//

import Foundation
import SwiftUI
  
extension View {
    func toast(isPresented: Binding<Bool>, message: String, type: AlertType) -> some View {
        self.modifier(ToastModifier(isPresented: isPresented, message: message, alertType: type))
    }
    
}

extension Date {
    func formatted(as format: String = "dd MMMM yyyy HH:mm", locale: Locale = Locale(identifier: "es_ES")) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = locale
        return formatter.string(from: self)
    }
}
