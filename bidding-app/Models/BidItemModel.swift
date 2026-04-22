//
//  BidItemModel.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 17/04/26.
//

import Foundation

enum BidStatus {
    case open, close
}

struct BidItemModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let imageUrl: String
    let bidder: String
    let bidOpenPrice: Decimal
    let bidOpensAt: Date
    let bidClosesAt: Date
    var history: [BidHistoryModel]
    
    var bidStatus: BidStatus {
        return Date.now < bidClosesAt ? .open : .close
    }
    
    func findHighestBid() -> Decimal? {
        return history.max(by: { $0.price < $1.price })?.price
    }

    func calculateIncreasingBid() -> Decimal? {
        guard let highest = findHighestBid() else { return nil }
        return highest - bidOpenPrice
    }
    
    var historyWithIncrement: [(history: BidHistoryModel, increment: Decimal)] {
        history.enumerated().map { index, entry in
            let previousPrice = index == 0 ? bidOpenPrice : history[index - 1].price
            return (history: entry, increment: entry.price - previousPrice)
        }
    }
}
