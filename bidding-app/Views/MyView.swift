//
//  ItemView.swift
//  Bidding App
//
//  Created by I Gusti Ngurah Bagus Ferry Mahayudha on 21/04/26.
//

import SwiftUI
import Charts

struct MyView: View {
    @State private var store = MockData()
    
    var body: some View {
        CommonItemListView(title: "My Items", store: $store)
    }
}

struct AddBidItemSheet: View {
    @Environment(\.dismiss) var dismiss
    var store: MockData // Reference to the shared store
    
    @State private var name = ""
    @State private var price = ""
    @State private var description = ""
    @State private var closeDate = Date()
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section("Sneaker Details") {
                    TextField("Sneaker Name", text: $name)
                    TextField("Opening Price", text: $price)
                        .keyboardType(.decimalPad)
                    TextField("Sneakers Description:", text: $description)
                }
                
                Section("Timeline") {
                    DatePicker("Bid Closes At", selection: $closeDate, displayedComponents: .date)
                }
                
                Button("Add Item") {
                    let newPrice = Decimal(string: price) ?? 0
                    let newItem = BidItemModel(
                        name: name,
                        description: description,
                        imageUrl: "shoes",
                        bidOpenPrice: newPrice,
                        bidOpensAt: Date(),
                        bidClosesAt: closeDate,
                        history: [
                            BidHistoryModel(name: "SneakerHead_Budi",   price: 2_650_000,  createdAt: .daysAgo(7, hour: 9,  minute: 15)),
                            BidHistoryModel(name: "KickCollector_Andi", price: 2_900_000,  createdAt: .daysAgo(7, hour: 14, minute: 42)),
                            BidHistoryModel(name: "RareFinds_Dewi",     price: 3_050_000,  createdAt: .daysAgo(6, hour: 8,  minute: 5)),
                            BidHistoryModel(name: "SneakerHead_Budi",   price: 3_400_000,  createdAt: .daysAgo(6, hour: 20, minute: 30)),
                            BidHistoryModel(name: "HypeKick_Fajar",     price: 3_550_000,  createdAt: .daysAgo(5, hour: 11, minute: 18)),
                            BidHistoryModel(name: "KickCollector_Andi", price: 3_800_000,  createdAt: .daysAgo(5, hour: 23, minute: 55)),
                            BidHistoryModel(name: "SneakerVault_Tono",  price: 3_950_000,  createdAt: .daysAgo(4, hour: 7,  minute: 40)),
                            BidHistoryModel(name: "RareFinds_Dewi",     price: 4_300_000,  createdAt: .daysAgo(4, hour: 16, minute: 22)),
                            BidHistoryModel(name: "SneakerHead_Budi",   price: 4_450_000,  createdAt: .daysAgo(3, hour: 10, minute: 5)),
                            BidHistoryModel(name: "HypeKick_Fajar",     price: 4_750_000,  createdAt: .daysAgo(3, hour: 19, minute: 48)),
                            BidHistoryModel(name: "KickCollector_Andi", price: 4_900_000,  createdAt: .daysAgo(2, hour: 8,  minute: 33)),
                            BidHistoryModel(name: "YeezyFan_Riko",      price: 5_200_000,  createdAt: .daysAgo(2, hour: 15, minute: 10)),
                            BidHistoryModel(name: "SneakerVault_Tono",  price: 5_250_000,  createdAt: .daysAgo(1, hour: 9,  minute: 27)),
                            BidHistoryModel(name: "RareFinds_Dewi",     price: 5_600_000,  createdAt: .daysAgo(1, hour: 18, minute: 3)),
                            BidHistoryModel(name: "SneakerHead_Budi",   price: 5_750_000,  createdAt: .daysAgo(0, hour: 7,  minute: 44)),
                        ]
                    )
                    
                    // This updates the shared @Observable store
                    store.allItems.append(newItem)
                    dismiss()
                }
                .disabled(name.isEmpty || price.isEmpty)
                
            }
            .navigationTitle("New Auction")
            .toolbar {
                Button("Cancel") { dismiss() }
            }
        }
    }
}

#Preview {
    MyView()
}
