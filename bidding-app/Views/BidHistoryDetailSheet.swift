//
//  BidHistoryDetailSheet.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 20/04/26.
//

import SwiftUI

struct BidHistoryDetailSheet: View {
    let bid: BidHistoryModel
    let highestBid: Decimal
    let previousBid: Decimal?
    
    private var diffFromHighest: Decimal { bid.price - highestBid }
    private var diffFromPrevious: Decimal? {
        guard let previousBid else { return nil }
        return bid.price - previousBid
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack {
                        Text("Bidder")
                            .fontWeight(.thin)
                        Spacer()
                        Text(bid.name)
                    }
                    .frame(alignment: .leading)
                    
                    HStack {
                        Text("Price")
                            .fontWeight(.thin)
                        Spacer()
                        Text("Rp \(bid.price.toCurrencyString())")
                    }
                    .frame(alignment: .leading)
                    
                    HStack {
                        Text("vs Highest Bid")
                            .fontWeight(.thin)
                        Spacer()
                        Text("\(diffFromHighest >= 0 ? "+" : "")Rp \(diffFromHighest.toCurrencyString())")
                            .foregroundStyle(diffFromHighest >= 0 ? .green : .red)
                    }
                    
                    if let diff = diffFromPrevious {
                        HStack {
                            Text("vs Previous Bid")
                                .fontWeight(.thin)
                            Spacer()
                            Text("\(diff >= 0 ? "+" : "")Rp \(diff.toCurrencyString())")
                                .foregroundStyle(diff >= 0 ? .green : .red)
                        }
                    }
                    
                    HStack {
                        Text("Placed at")
                            .fontWeight(.thin)
                        Spacer()
                        Text(bid.createdAt.toFormattedStringWithTime())
                    }
                    .frame(alignment: .leading)
                }
                .frame(alignment: .leading)
                
                Spacer()
            }
            .frame(alignment: .leading)
            .padding()
            .presentationDetents([.medium])
            .navigationTitle("Bid Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    BidHistoryDetailSheet(
        bid: BidItemData.bidItems[1].history[1],
        highestBid: BidItemData.bidItems[1].history[14].price,
        previousBid: BidItemData.bidItems[1].history[0].price)
}
