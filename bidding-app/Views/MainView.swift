//
//  ContentView.swift
//  Bidding App
//
//  Created by I Gusti Ngurah Bagus Ferry Mahayudha on 21/04/26.
//

import SwiftUI
import Charts

struct MainView: View {
    var body: some View {
        TabView {
            // Tab 1: Your Sneakers List
            BiddingView()
                .tabItem {
                    Label("Bidding", systemImage: "gavel.fill")
                }
            
            // Tab 2: A featured Item or Profile
            MyView() // Example: showing the first item
                .tabItem {
                    Label("My Item", systemImage: "star.fill")
                }
            
            // Tab 3: Settings or Profile
            Text("Profile View")
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        // This ensures the icons and text contrast well if you use a dark theme
        .tint(.blue)
    }
}

struct BiddingView: View {
    
    @State private var store = MockData()
    var body: some View {
            CommonBiddingListView(title: "Sneakers", store: $store)
        }
    
}

#Preview {
    MainView()
}
