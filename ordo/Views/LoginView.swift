//
//  LoginView.swift
//  Ordo
//
//  Created by Alexander George on 1/17/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {

            VStack(spacing: 30) {
                Spacer()
                
                Text("Ordo")
                    .font(.system(size: 50, weight: .bold))
     
                
                VStack(spacing: 16) {
                    OrdoTextField(
                        placeholder: "Email",
                        text: $authViewModel.email,
                        isSecure: false
                    )
                    
                    OrdoTextField(
                        placeholder: "Password",
                        text: $authViewModel.password,
                        isSecure: true
                    )
                }
                .padding(.horizontal, 32)
                
                Button(action: {
                    authViewModel.login()
                }) {
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 32)
                
                Spacer()
            }
        }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}
