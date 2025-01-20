//
//  ProfileView.swift
//  Ordo
//
//  Created by OrdoDev on 1/17/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 32) {
                    // Profile Header Section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            VStack(alignment: .center, spacing: 4) {
                                Text("Alexander George")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                
                                Text("geoalexander03")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Profile Actions Section
                    VStack(spacing: 16) {
                        Button(action: {
                            // Edit Profile action
                            print("button clicked!")
                        }) {
                            ActionRow(icon: "pencil", title: "Edit Profile", subtitle: "Update your profile info")
                        }
                    }
                    .padding(.horizontal)
                    
                    // Account & Settings Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Account & Settings")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        VStack(spacing: 1) {
                            Button(action: {
                                // Personal action
                                print("button clicked!")
                            }) {
                                SettingRow(icon: "person.fill", title: "Personal")
                            }
                            
                            Button(action: {
                                // Linked Banks action
                                print("button clicked!")
                            }) {
                                SettingRow(icon: "building.columns.fill", title: "Linked Banks")
                            }
                            
                            Button(action: {
                                print("button clicked!")
                            }) {
                                SettingRow(icon: "shield.lefthalf.filled", title: "Security & Privacy")
                            }

                            
                            Button(action: {
                                // Contact Support action
                                print("button clicked!")
                            }) {
                                SettingRow(icon: "bubble.left.and.bubble.right.fill", title: "Support")
                            }
                        }
                        .cornerRadius(12)
                        .padding(.horizontal)
                        
                        Button(action: {
                            
                        }) {
                            Text("Sign Out")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(.red)
                                .cornerRadius(30)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .background(Color(.systemBackground))
        }
    }
}

struct ActionRow: View {
    let icon: String
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(spacing: 16) {
            Circle()
                .fill(Color(.secondarySystemFill))
                .frame(width: 36, height: 36)
                .overlay(
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.primary)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .contentShape(Rectangle()) // Ensures the entire row is tappable
    }
}

struct SettingRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.primary)
                .foregroundColor(.primary)
            
            Text(title)
                .font(.body).foregroundColor(.primary)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.primary)
        }
        .padding()
        .contentShape(Rectangle()) // Ensures the entire row is tappable
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
