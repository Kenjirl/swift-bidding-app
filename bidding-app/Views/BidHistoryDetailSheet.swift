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
        VStack {
            VStack {
                Text("Bid Detail")
                    .bold()
            }
            .padding()
            
            Divider()
            
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
            .padding()
            
            Spacer()
        }
        .frame(alignment: .leading)
        .padding()
        .presentationDetents([.medium])
    }
}
