//
//  CreateBidSheet.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 21/04/26.
//

import SwiftUI

struct CreateBidSheet: View {
    @Binding var history: [BidHistoryModel]
    let highestBid: Decimal
    let onSuccess: () -> Void
    
    let user = BidItemData.user
    
    @State private var bidInput: String = ""
    @State private var bidDifference: String = "0"
    @State private var bidDifferenceColor: Color = .primary
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    
    func countDifference(value: String) {
        guard let input = Decimal(string: value) else {
            bidDifference = "0"
            bidDifferenceColor = .primary
            return
        }

        let diff = input - highestBid
        let formatted = abs(diff).toCurrencyString()

        if diff > 0 {
            bidDifference = "+\(formatted)"
            bidDifferenceColor = .green
        } else if diff < 0 {
            bidDifference = "-\(formatted)"
            bidDifferenceColor = .red
        } else {
            bidDifference = "0"
            bidDifferenceColor = .primary
        }
    }
    
    func submitBid() {
        guard let price = Decimal(string: bidInput) else { return }
        
        guard price > highestBid else {
            showAlert = true
            return
        }
        
        let newBid = BidHistoryModel(
            name: user,
            price: price,
            createdAt: Date()
        )
        history.append(newBid)
        onSuccess()
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack {
                        Text("Bidding as")
                            .fontWeight(.thin)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text(user)
                            .bold()
                    }
                    
                    HStack {
                        Text("Current Bid")
                            .fontWeight(.thin)
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("Rp \(highestBid.toCurrencyString())")
                    }
                    .frame(alignment: .leading)
                    
                    VStack {
                        TextField("Place Your Bid", text: $bidInput)
                            .textFieldStyle(.plain)
                            .keyboardType(.decimalPad)
                            .onChange(of: bidInput) {
                                countDifference(value: bidInput)
                            }
                        
                        Divider()
                    }
                    
                    HStack {
                        Spacer()
                        Text("Rp \(bidDifference)")
                            .foregroundStyle(bidDifferenceColor)
                    }
                }
                .frame(alignment: .leading)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding()
            .presentationDetents([.medium])
            .navigationTitle("Place Your Bid")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .tint(.primary)
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        submitBid()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .tint(.blue)
                }
            }
            .alert("Bid too low", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Your bid needs to be higher than Rp \(highestBid.toCurrencyString()).")
            }
        }
    }
}

#Preview {
    @Previewable @State var history = BidItemData.bidItems[0].history
    
    CreateBidSheet(
        history: $history,
        highestBid: history[history.count - 1].price,
        onSuccess: { print("Success!") }
    )
}
