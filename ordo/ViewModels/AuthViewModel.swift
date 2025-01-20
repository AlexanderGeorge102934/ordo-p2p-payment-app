//
//  AuthViewModel.swift
//  Ordo
//
//  Created by OrdoDev on 1/17/25.
//

import SwiftUI
import Combine

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    
    func login() {
        // Backend call placeholder, do not implement
        // On successful response:
        isLoggedIn = true
    }
    
    func logout() {
        // Backend call placeholder
        isLoggedIn = false
        email = ""
        password = ""
    }
}
