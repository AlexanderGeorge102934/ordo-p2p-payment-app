//
//  TextField.swift
//  Ordo
//
//  Created by OrdoDev on 1/17/25.
//

import SwiftUI

/// A reusable styled text field for either secure or standard text input.
struct OrdoTextField: View {
    let placeholder: String
    @Binding var text: String
    let isSecure: Bool
    
    var body: some View {
        if isSecure {
            SecureField(placeholder, text: $text)
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(12)
                .font(.system(.body, design: .rounded))
        } else {
            TextField(placeholder, text: $text)
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(12)
                .font(.system(.body, design: .rounded))
        }
    }
}
