//
//  ContentView.swift
//  Ordo
//
//  Created by Alexander George on 1/17/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Group {
            // If user is logged show main screen
            if authViewModel.isLoggedIn {
                MainView()
            }
            // Show login screen if not signed in
            else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
