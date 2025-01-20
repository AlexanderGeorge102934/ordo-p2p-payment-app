//
//  ProfileViewModel.swift
//  Ordo
//
//  Created by Alexander George on 1/17/25.
//

import SwiftUI
import Combine

/// For a user's profile only
class ProfileViewModel: ObservableObject {
    @Published var username: String = "NewUser"
    @Published var email: String = "user@ordo.com"
    
    func updateProfile() {
        // Backend call placeholder
    }
}
