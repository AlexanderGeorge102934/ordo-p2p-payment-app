//
//  MainView.swift
//  Ordo
//
//  Created by OrdoDev on 1/17/25.
//

import SwiftUI

/// A tab view hosting Payment, History, and Profile screens.
struct MainView: View {
    
    init() {
            // Customize Tab Bar appearance for unselected items
            UITabBar.appearance().unselectedItemTintColor = UIColor.black
        }
    
    var body: some View {
        TabView {
            TransactionHistoryView()
                .tabItem {
                    Image(systemName: "calendar")
                }
            
            PaymentView()
                .tabItem {
                    Image(systemName: "sparkle")
                }
        
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
        .accentColor(.primaryAccent)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
