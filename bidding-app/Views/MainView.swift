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
                    Label("Home", systemImage: "house")
                }
            
            // Tab 2: A featured Item or Profile
            MyView() // Example: showing the first item
                .tabItem {
                    Label("My Item", systemImage: "shippingbox.fill")
                }
            
            // Tab 3: Settings or Profile
            Text("Profile View")
                .tabItem {
                    Label("Bid History", systemImage: "list.bullet")
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
