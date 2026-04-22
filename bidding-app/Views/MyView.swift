//
//  ItemView.swift
//  Bidding App
//
//  Created by I Gusti Ngurah Bagus Ferry Mahayudha on 21/04/26.
//

import SwiftUI
import Charts

struct MyView: View {
    @Binding var items: [BidItemModel]

    var body: some View {
        CommonItemListView(title: "My Items", items: $items)
    }
}

struct AddBidItemSheet: View {
    @Environment(\.dismiss) var dismiss
    @Binding var items: [BidItemModel]
    
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
                        bidder: "Kenji",
                        bidOpenPrice: newPrice,
                        bidOpensAt: Date(),
                        bidClosesAt: closeDate,
                        history: []
                    )
                    
                    items.append(newItem)
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

//#Preview {
//    MyView()
//}
