//
//  BidHistoryModel.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 17/04/26.
//

import Foundation

struct BidHistoryModel: Identifiable {
    let id = UUID()
    let name: String
    let price: Decimal
    let createdAt: Date
}
