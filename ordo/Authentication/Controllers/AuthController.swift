////
////  AuthController.swift
////  ordo
////
////  Created by Alexander George on 1/20/25.
////
//
//import Foundation
//import Combine
//
///// The AuthController (ObservableObject) acts as the 'Controller' in MVC:
///// - It calls `CognitoAuthService` for network tasks.
///// - It holds state that the Views can display.
///// - In classic MVC, you'd have a ViewController (UIKit).
/////   With SwiftUI, we rely on @StateObject/@ObservedObject
/////   to keep track of changes for the View.
//class AuthController: ObservableObject {
//    
//    // MARK: - Published Properties
//    @Published var currentUser: User?
//    @Published var idToken: String?
//    @Published var accessToken: String?
//    @Published var refreshToken: String?
//    @Published var errorMessage: String?
//    @Published var isEmailVerified: Bool = false
//    
//    private let authService = CognitoAuthService()
//    
//    // Example sign-up method
//    func signUp(username: String, password: String) {
//        authService.signUp(username: username, password: password) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success():
//                    self?.errorMessage = "Sign up successful. Please check your email for the confirmation code."
//                case .failure(let error):
//                    self?.errorMessage = "Sign up failed: \(error.localizedDescription)"
//                }
//            }
//        }
//    }
//    
//    // Example verify email method
//    func verifyEmail(confirmationCode: String, email: String) {
//        authService.verifyEmail(confirmationCode: confirmationCode, email: email) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success():
//                    self?.isEmailVerified = true
//                    self?.errorMessage = "Email verified successfully. You can now sign in."
//                case .failure(let error):
//                    self?.errorMessage = "Email verification failed: \(error.localizedDescription)"
//                }
//            }
//        }
//    }
//    
//    // Example sign-in method
//    func signIn(username: String, password: String) {
//        authService.signIn(username: username, password: password) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let tokens):
//                    self?.idToken = tokens.idToken
//                    self?.accessToken = tokens.accessToken
//                    self?.refreshToken = tokens.refreshToken
//                    self?.errorMessage = "Sign in successful."
//                    
//                    // You can also fetch user info here from your backend if needed.
//                    self?.currentUser = User(id: UUID().uuidString, // In a real app, you'd parse an actual user ID
//                                             username: username,
//                                             email: username)
//                case .failure(let error):
//                    self?.errorMessage = "Sign in failed: \(error.localizedDescription)"
//                }
//            }
//        }
//    }
//    
//    // Example refresh token method
//    func refresh() {
//        guard let refreshToken = refreshToken else {
//            errorMessage = "No refresh token available."
//            return
//        }
//        authService.refreshToken(refreshToken: refreshToken) { [weak self] result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let tokens):
//                    self?.idToken = tokens.idToken
//                    self?.accessToken = tokens.accessToken
//                    self?.refreshToken = tokens.refreshToken
//                    self?.errorMessage = "Token refreshed successfully."
//                case .failure(let error):
//                    self?.errorMessage = "Token refresh failed: \(error.localizedDescription)"
//                }
//            }
//        }
//    }
//    
//    func signOut() {
//        // Clear tokens and current user
//        idToken = nil
//        accessToken = nil
//        refreshToken = nil
//        currentUser = nil
//        errorMessage = nil
//        isEmailVerified = false
//    }
//}
