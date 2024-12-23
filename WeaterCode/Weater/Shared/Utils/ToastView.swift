//
//  ToastView.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 22/12/24.
//

import Foundation
import SwiftUI
struct ToastView: View {
    let message: String
    let alertType: AlertType
    var body: some View {
        HStack {
            Image(systemName: alertType.icon)
                .foregroundColor(.white)
            Text(message)
                .foregroundColor(.white)
        }
        .padding()
        .background(alertType.color)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}


#Preview {
    ToastView(message: "No se ha encontrado", alertType: .error)
}
