//
//  CommonBiddingListView.swift
//  bidding-app
//
//  Created by I Gusti Ngurah Bagus Ferry Mahayudha on 21/04/26.
//

import SwiftUI

struct SortMenu: View {
    // We use @Binding so that when the user clicks a button here,
    // it updates the sortOrder in the parent View (CommonBiddingListView)
    @Binding var sortOrder: CommonBiddingListView.SortType

    var body: some View {
        Menu {
            Section("Alphabet Sorting") {
                Button(action: { sortOrder = .alphabetical_asc }) {
                    Label("By Alphabet (A-Z)", systemImage: "textformat")
                }
                
                Button(action: { sortOrder = .alphabetical_desc }) {
                    Label("By Alphabet (Z-A)", systemImage: "textformat")
                }
            }
            
            Section("Price Sorting") {
                Button(action: { sortOrder = .price_asc }) {
                    Label("By Lowest to Highest", systemImage: "dollarsign.circle")
                }
                
                Button(action: { sortOrder = .price_desc }) {
                    Label("By Highest to Lowest", systemImage: "dollarsign.circle")
                }
            }
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
        }
    }
}


struct CommonBiddingListView: View {
    var title: String
    @Binding var store: MockData // Shared reference
    
    @State private var searchText = ""
    @State private var sortOrder: SortType = .alphabetical_asc
    
    enum SortType {
        case alphabetical_asc, alphabetical_desc, price_asc, price_desc
    }

    var filteredItems: [BidItemModel] {
        var items = store.allItems
        if !searchText.isEmpty {
            items = items.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
        switch sortOrder {
            case .alphabetical_asc: return items.sorted { $0.name < $1.name }
            case .alphabetical_desc: return items.sorted { $0.name > $1.name }
            case .price_asc: return items.sorted { ($0.history.last?.price ?? $0.bidOpenPrice) < ($1.history.last?.price ?? $1.bidOpenPrice) }
            case .price_desc: return items.sorted { ($0.history.last?.price ?? $0.bidOpenPrice) > ($1.history.last?.price ?? $1.bidOpenPrice) }
        }
    }

    var body: some View {
        NavigationStack {
            List(filteredItems) { item in
                NavigationLink(destination: BidItemDetailView(item: item)) {
                    BiddingRowComponent(item: item)
                }
            }
            .listStyle(.plain)
            .navigationTitle(title)
            .searchable(text: $searchText, prompt: "Search sneakers")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    SortMenu(sortOrder: $sortOrder)
                }
            }
        }
    }
}
