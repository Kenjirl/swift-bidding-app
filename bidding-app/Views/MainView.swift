//
//  ContentView.swift
//  Bidding App
//
//  Created by I Gusti Ngurah Bagus Ferry Mahayudha on 21/04/26.
//

import SwiftUI
import Charts

struct MainView: View {
    @State private var items = BidItemData.bidItems

    var body: some View {
        TabView {
            BiddingView(items: $items)
                .tabItem { Label("Home", systemImage: "house") }
            
            MyView(items: $items)
                .tabItem { Label("My Item", systemImage: "shippingbox.fill") }
            
            Text("Profile View")
                .tabItem { Label("Bid History", systemImage: "list.bullet") }
        }
        .tint(.blue)
    }
}

struct BiddingView: View {
    @Binding var items: [BidItemModel]

    var body: some View {
        CommonBiddingListView(title: "Sneakers", items: $items)
    }
}

#Preview {
    MainView()
}
