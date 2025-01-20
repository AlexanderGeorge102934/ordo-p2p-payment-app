//
//  OrdoBackgroundView.swift
//  Ordo
//
//  Created by OrdoDev on 1/17/25.
//

import SwiftUI

/// A reusable background that layers a multi-color gradient + a subtle overlay.
struct OrdoBackgroundView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
//            LinearGradient(
//                gradient: Gradient(colors: [Color.ordoGreen, Color.ordoOrange, Color.ordoRed]),
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            )
//            .ignoresSafeArea()
            
            // Slight overlay for a more subdued effect
            Color.black
            
            content
        }
    }
}
