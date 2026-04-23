//
//  MyBidHistory.swift
//  bidding-app
//
//  Created by I Gusti Ngurah Bagus Ferry Mahayudha on 22/04/26.
//

import SwiftUI

struct HistorySort: View {
    // We use @Binding so that when the user clicks a button here,
    // it updates the sortOrder in the parent View (CommonBiddingListView)
    @Binding var sortOrder: MyBidHistory.SortType

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
            
            Section("Date Sorting") {
                Button(action: { sortOrder = .date_asc }) {
                    Label("By Earliest to Latest", systemImage: "dollarsign.circle")
                }
                
                Button(action: { sortOrder = .date_desc }) {
                    Label("By Latest to Earliest", systemImage: "dollarsign.circle")
                }
            }
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
        }
    }
}

struct MyBidHistory: View {
    
    @Binding var history: [BidItemModel]
    @State var username: String = BidItemData.user
    
    @State private var searchText = ""
    @State private var sortOrder: SortType = .alphabetical_asc

    enum SortType {
        case alphabetical_asc, alphabetical_desc, date_asc, date_desc
    }
    
    func countBidHistory(history: [BidItemModel]) -> Bool {
        if (history.count == 0) { return false }
        return true
    }
    
    var filteredItems: [BidItemModel] {
        
        var result = history
        if !searchText.isEmpty {
            result = result.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
        
        switch sortOrder {
            
            case .alphabetical_asc:  return result.sorted { $0.name < $1.name }
            case .alphabetical_desc: return result.sorted { $0.name > $1.name }
            case .date_asc:
                return result.sorted { ($0.history.first?.createdAt ?? .now) < ($1.history.first?.createdAt ?? .now) }
            case .date_desc:
                return result.sorted { ($0.history.first?.createdAt ?? .now) > ($1.history.first?.createdAt ?? .now) }
            
        }
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Text(username)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .bold()
                    .padding(.bottom)
                
                if (countBidHistory(history: history)) {
                    List {
                        // 1. Loop through each sneaker
                        ForEach(filteredItems) { item in
                            ForEach(item.historyWithIncrement.reversed(), id: \.history.id) { bid in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        
                                        Text(item.name)
                                            .font(.subheadline) // 2. Changed from .caption to .headline
                                            .fontWeight(.bold)
                                        
                                        Text(bid.history.createdAt.toFormattedString())
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("Rp \(bid.history.price.toCompactString())")
                                        .font(.caption)
                                        .foregroundStyle(.blue)
                                }
                                
                                
                            }
                        }
                    }
                    .frame(width: .infinity, height: 500, alignment: .top)
                    .listStyle(.plain)
    
                    
                }
                
                else {
                    Text("No Bid History Yet")
                        .padding(.top)
                        .font(.default)
                        .fontWeight(.light)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .searchable(text: $searchText, prompt: "Search items")
            .toolbar {
                HistorySort(sortOrder: $sortOrder)
            }
        }
    }
        
}

#Preview {
    // ✅ Fix: Use .constant to provide a Binding in previews
    MyBidHistory(history: .constant(MockData().allHistory))
}
