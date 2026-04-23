//
//  BidHistoryData.swift
//  bidding-app
//
//  Created by I Gusti Ngurah Bagus Ferry Mahayudha on 23/04/26.
//

import Foundation
import UIKit

struct BidHistoryData {
    
    static let userBidHistory: [BidItemModel] = [
        BidItemModel(
            name: "Adidas Yeezy Boost 350 V2 Zebra",
            description: "Yeezy 350 V2 colorway Zebra, ukuran 42. Authentic 100%, sudah di-legit check. Box original masih mulus.",
            imageUrl: UIImage(named: "adidas_yeezy_350_zebra"),
            bidder: "Bagus",
            bidOpenPrice: 3_000_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(2),
            history: [
                BidHistoryModel(name: "Kenji", price: 3_500_000,  createdAt: .daysAgo(7, hour: 22, minute: 5)),
            ]
        ),
        
        BidItemModel(
            name: "Adidas Yeezy Boost 350 V2 Zebra",
            description: "Yeezy 350 V2 colorway Zebra, ukuran 42. Authentic 100%, sudah di-legit check. Box original masih mulus.",
            imageUrl: UIImage(named: "adidas_yeezy_350_zebra"),
            bidder: "Bagus",
            bidOpenPrice: 3_000_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(2),
            history: [
                BidHistoryModel(name: "Kenji", price: 4_350_000,  createdAt: .daysAgo(4, hour: 8,  minute: 12)),
            ]
        ),
        
        BidItemModel(
            name: "Adidas Yeezy Boost 350 V2 Zebra",
            description: "Yeezy 350 V2 colorway Zebra, ukuran 42. Authentic 100%, sudah di-legit check. Box original masih mulus.",
            imageUrl: UIImage(named: "adidas_yeezy_350_zebra"),
            bidder: "Bagus",
            bidOpenPrice: 3_000_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(2),
            history: [
                BidHistoryModel(name: "Kenji", price: 5_500_000,  createdAt: .daysAgo(2, hour: 19, minute: 40)),
            ]
        ),
        
        BidItemModel(
            name: "New Balance 550 White Green",
            description: "New Balance 550 kolaborasi eksklusif. Ukuran 41, kondisi 9/10, dipakai hanya 2x. Cocok untuk daily wear maupun koleksi.",
            imageUrl: UIImage(named: "new_balance_550_white_green"),
            bidder: "Fajar",
            bidOpenPrice: 1_200_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(0, hour: 12),
            history: [
                BidHistoryModel(name: "Kenji", price: 2_200_000,  createdAt: .daysAgo(5, hour: 18, minute: 22)),
            ]
        ),
        
        BidItemModel(
            name: "New Balance 550 White Green",
            description: "New Balance 550 kolaborasi eksklusif. Ukuran 41, kondisi 9/10, dipakai hanya 2x. Cocok untuk daily wear maupun koleksi.",
            imageUrl: UIImage(named: "new_balance_550_white_green"),
            bidder: "Fajar",
            bidOpenPrice: 1_200_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(0, hour: 12),
            history: [
                BidHistoryModel(name: "Kenji", price: 2_700_000,  createdAt: .daysAgo(3, hour: 14, minute: 30)),
            ]
        ),
        
        BidItemModel(
            name: "New Balance 550 White Green",
            description: "New Balance 550 kolaborasi eksklusif. Ukuran 41, kondisi 9/10, dipakai hanya 2x. Cocok untuk daily wear maupun koleksi.",
            imageUrl: UIImage(named: "new_balance_550_white_green"),
            bidder: "Fajar",
            bidOpenPrice: 1_200_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(0, hour: 12),
            history: [
                BidHistoryModel(name: "Kenji", price: 4_100_000,  createdAt: .daysAgo(0, hour: 9,  minute: 18)),
            ]
        ),
        
        
    ]
}
