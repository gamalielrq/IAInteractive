//
//  ToastModifier.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 22/12/24.
//

import Foundation
import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    let message: String
    let alertType: AlertType
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                VStack {
                    Spacer()
                    ToastView(message: message, alertType: alertType)
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    isPresented = false
                                }
                            }
                        }
                }
                .padding(.bottom, 100) // Ajusta la posición del Toast
            }
        }
    }
}
