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
    @State private var history = BidHistoryData.userBidHistory

    var body: some View {
        TabView {
            BiddingView(items: $items)
                .tabItem { Label("Home", systemImage: "house") }
            
            MyView(items: $items)
                .tabItem { Label("My Item", systemImage: "shippingbox.fill") }
            
            MyBidHistory(history: $history)
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
