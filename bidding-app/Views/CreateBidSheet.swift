//
//  CreateBidSheet.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 21/04/26.
//

import SwiftUI

struct CreateBidSheet: View {
    let highestBid: Decimal
    
    @State private var nameInput: String = ""
    @State private var bidInput: String = ""
    @State private var bidDifference: String = "0"
    @State private var bidDifferenceColor: Color = .primary
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
        // add data to history
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    VStack {
                        TextField("Name", text: $nameInput)
                            .textFieldStyle(.plain)
                        
                        Divider()
                    }
                    .padding(.bottom)
                    
                    VStack {
                        HStack {
                            Text("Current Bid")
                                .fontWeight(.thin)
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
                }
                .frame(alignment: .leading)
                
                Spacer()
            }
            .frame(alignment: .leading)
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
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        submitBid()
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .tint(.blue)
                }
            }
        }
    }
}

#Preview {
    CreateBidSheet(highestBid: 2_000_000)
}
