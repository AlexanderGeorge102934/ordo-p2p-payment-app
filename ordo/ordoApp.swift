//
//  OrdoApp.swift
//  Ordo
//
//  Created by Alexander George on 1/17/25.
//

import SwiftUI

@main
struct OrdoApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}
