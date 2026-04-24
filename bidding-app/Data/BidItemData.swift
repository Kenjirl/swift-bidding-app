//
//  BidItemData.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 17/04/26.
//

import Foundation
import UIKit

struct BidItemData {
    static let user: String = "Kenji"
    
    static let bidItems: [BidItemModel] = [
        BidItemModel(
            name: "New Balance 2002R Protection Pack Smoke",
            description: "New Balance 2002R Protection Pack colorway Smoke. Kondisi deadstock, belum pernah dipakai. Ukuran 42, lengkap dengan box original dan extra lace.",
            imageUrl: UIImage(named: "nb_2002r_smoke"),
            bidder: "Bagus",
            bidOpenPrice: 1_800_000,
            bidOpensAt: .daysAgo(12),
            bidClosesAt: .daysAgo(5),
            history: [
                BidHistoryModel(name: "Dewi",   price: 1_950_000,  createdAt: .daysAgo(12, hour: 9,  minute: 20)),
                BidHistoryModel(name: "Sari",   price: 2_100_000,  createdAt: .daysAgo(11, hour: 13, minute: 45)),
                BidHistoryModel(name: "Ricko",  price: 2_300_000,  createdAt: .daysAgo(11, hour: 20, minute: 10)),
                BidHistoryModel(name: "Kenji",  price: 2_450_000,  createdAt: .daysAgo(10, hour: 8,  minute: 35)),
                BidHistoryModel(name: "Fajar",  price: 2_600_000,  createdAt: .daysAgo(9,  hour: 14, minute: 55)),
                BidHistoryModel(name: "Sari",   price: 2_800_000,  createdAt: .daysAgo(8,  hour: 10, minute: 30)),
                BidHistoryModel(name: "Ricko",  price: 2_950_000,  createdAt: .daysAgo(7,  hour: 17, minute: 18)),
                BidHistoryModel(name: "Fajar",  price: 3_100_000,  createdAt: .daysAgo(6,  hour: 9,  minute: 42)),
                BidHistoryModel(name: "Sari",   price: 3_300_000,  createdAt: .daysAgo(5,  hour: 8,  minute: 5)),
            ]
        ),
        BidItemModel(
            name: "Nike Air Jordan 1 Retro High OG",
            description: "Iconic sneaker in the classic Chicago colorway. Deadstock condition, never worn. Comes with original box and all accessories.",
            imageUrl: UIImage(named: "nike_air_jordan_1"),
            bidder: "Kenji",
            bidOpenPrice: 2_500_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(1),
            history: [
                BidHistoryModel(name: "Dewi",  price: 2_650_000,  createdAt: .daysAgo(7, hour: 9,  minute: 15)),
                BidHistoryModel(name: "Bagus", price: 2_900_000,  createdAt: .daysAgo(7, hour: 14, minute: 42)),
                BidHistoryModel(name: "Dewi",  price: 3_050_000,  createdAt: .daysAgo(6, hour: 8,  minute: 5)),
                BidHistoryModel(name: "Tono",  price: 3_400_000,  createdAt: .daysAgo(6, hour: 20, minute: 30)),
                BidHistoryModel(name: "Fajar", price: 3_550_000,  createdAt: .daysAgo(5, hour: 11, minute: 18)),
                BidHistoryModel(name: "Bagus", price: 3_800_000,  createdAt: .daysAgo(5, hour: 23, minute: 55)),
                BidHistoryModel(name: "Tono",  price: 3_950_000,  createdAt: .daysAgo(4, hour: 7,  minute: 40)),
                BidHistoryModel(name: "Dewi",  price: 4_300_000,  createdAt: .daysAgo(4, hour: 16, minute: 22)),
                BidHistoryModel(name: "Tono",  price: 4_450_000,  createdAt: .daysAgo(3, hour: 10, minute: 5)),
                BidHistoryModel(name: "Fajar", price: 4_750_000,  createdAt: .daysAgo(3, hour: 19, minute: 48)),
                BidHistoryModel(name: "Bagus", price: 4_900_000,  createdAt: .daysAgo(2, hour: 8,  minute: 33)),
                BidHistoryModel(name: "Ricko", price: 5_200_000,  createdAt: .daysAgo(2, hour: 15, minute: 10)),
                BidHistoryModel(name: "Tono",  price: 5_250_000,  createdAt: .daysAgo(1, hour: 9,  minute: 27)),
                BidHistoryModel(name: "Dewi",  price: 5_600_000,  createdAt: .daysAgo(1, hour: 18, minute: 3)),
                BidHistoryModel(name: "Ricko", price: 5_750_000,  createdAt: .daysAgo(0, hour: 7,  minute: 44)),
            ]
        ),
        BidItemModel(
            name: "Adidas Yeezy Boost 350 V2 Zebra",
            description: "Yeezy 350 V2 in Zebra colorway, size US 8.5. 100% authentic, legit checked. Original box still in pristine condition.",
            imageUrl: UIImage(named: "adidas_yeezy_350_zebra"),
            bidder: "Bagus",
            bidOpenPrice: 3_000_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(2),
            history: [
                BidHistoryModel(name: "Ricko", price: 3_150_000,  createdAt: .daysAgo(7, hour: 10, minute: 20)),
                BidHistoryModel(name: "Kenji", price: 3_500_000,  createdAt: .daysAgo(7, hour: 22, minute: 5)),
                BidHistoryModel(name: "Tono",  price: 3_650_000,  createdAt: .daysAgo(6, hour: 13, minute: 47)),
                BidHistoryModel(name: "Ricko", price: 4_000_000,  createdAt: .daysAgo(5, hour: 9,  minute: 30)),
                BidHistoryModel(name: "Sari",  price: 4_100_000,  createdAt: .daysAgo(5, hour: 17, minute: 55)),
                BidHistoryModel(name: "Kenji", price: 4_350_000,  createdAt: .daysAgo(4, hour: 8,  minute: 12)),
                BidHistoryModel(name: "Fajar", price: 4_700_000,  createdAt: .daysAgo(4, hour: 21, minute: 38)),
                BidHistoryModel(name: "Ricko", price: 4_800_000,  createdAt: .daysAgo(3, hour: 11, minute: 5)),
                BidHistoryModel(name: "Dewi",  price: 5_100_000,  createdAt: .daysAgo(3, hour: 16, minute: 50)),
                BidHistoryModel(name: "Tono",  price: 5_150_000,  createdAt: .daysAgo(2, hour: 7,  minute: 22)),
                BidHistoryModel(name: "Kenji", price: 5_500_000,  createdAt: .daysAgo(2, hour: 19, minute: 40)),
                BidHistoryModel(name: "Ricko", price: 5_650_000,  createdAt: .daysAgo(1, hour: 10, minute: 15)),
                BidHistoryModel(name: "Fajar", price: 5_900_000,  createdAt: .daysAgo(1, hour: 14, minute: 33)),
                BidHistoryModel(name: "Sari",  price: 6_050_000,  createdAt: .daysAgo(0, hour: 8,  minute: 48)),
                BidHistoryModel(name: "Tono",  price: 6_400_000,  createdAt: .daysAgo(0, hour: 11, minute: 5)),
            ]
        ),
        BidItemModel(
            name: "New Balance 550 White Green",
            description: "Exclusive New Balance 550 collaboration. Size US 7.5, condition 9/10, worn only twice. Perfect for daily wear or as a collection piece.",
            imageUrl: UIImage(named: "new_balance_550_white_green"),
            bidder: "Fajar",
            bidOpenPrice: 1_200_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(0, hour: 12),
            history: [
                BidHistoryModel(name: "Sari",  price: 1_350_000,  createdAt: .daysAgo(7, hour: 8,  minute: 10)),
                BidHistoryModel(name: "Dewi",  price: 1_500_000,  createdAt: .daysAgo(6, hour: 20, minute: 35)),
                BidHistoryModel(name: "Bagus", price: 1_900_000,  createdAt: .daysAgo(6, hour: 23, minute: 50)),
                BidHistoryModel(name: "Sari",  price: 2_050_000,  createdAt: .daysAgo(5, hour: 12, minute: 5)),
                BidHistoryModel(name: "Kenji", price: 2_200_000,  createdAt: .daysAgo(5, hour: 18, minute: 22)),
                BidHistoryModel(name: "Dewi",  price: 2_600_000,  createdAt: .daysAgo(4, hour: 9,  minute: 47)),
                BidHistoryModel(name: "Kenji", price: 2_700_000,  createdAt: .daysAgo(3, hour: 14, minute: 30)),
                BidHistoryModel(name: "Sari",  price: 2_850_000,  createdAt: .daysAgo(3, hour: 22, minute: 15)),
                BidHistoryModel(name: "Ricko", price: 3_100_000,  createdAt: .daysAgo(2, hour: 7,  minute: 55)),
                BidHistoryModel(name: "Bagus", price: 3_250_000,  createdAt: .daysAgo(2, hour: 16, minute: 40)),
                BidHistoryModel(name: "Sari",  price: 3_600_000,  createdAt: .daysAgo(1, hour: 10, minute: 20)),
                BidHistoryModel(name: "Tono",  price: 3_700_000,  createdAt: .daysAgo(1, hour: 19, minute: 5)),
                BidHistoryModel(name: "Dewi",  price: 3_950_000,  createdAt: .daysAgo(0, hour: 6,  minute: 33)),
                BidHistoryModel(name: "Kenji", price: 4_100_000,  createdAt: .daysAgo(0, hour: 9,  minute: 18)),
                BidHistoryModel(name: "Sari",  price: 4_350_000,  createdAt: .daysAgo(0, hour: 10, minute: 45)),
            ]
        ),
        BidItemModel(
            name: "Nike SB Dunk Low Travis Scott",
            description: "Rare Nike SB Dunk Low x Travis Scott collaboration. Size US 10, deadstock. Certificate of authenticity included. Market price keeps rising.",
            imageUrl: UIImage(named: "nike_sb_dunk_travis_scott"),
            bidder: "Kenji",
            bidOpenPrice: 8_000_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(3),
            history: [
                BidHistoryModel(name: "Fajar", price: 8_150_000,  createdAt: .daysAgo(7, hour: 11, minute: 20)),
                BidHistoryModel(name: "Tono",  price: 8_500_000,  createdAt: .daysAgo(7, hour: 19, minute: 45)),
                BidHistoryModel(name: "Bagus", price: 8_650_000,  createdAt: .daysAgo(6, hour: 8,  minute: 10)),
                BidHistoryModel(name: "Fajar", price: 9_000_000,  createdAt: .daysAgo(6, hour: 22, minute: 33)),
                BidHistoryModel(name: "Dewi",  price: 9_200_000,  createdAt: .daysAgo(5, hour: 13, minute: 5)),
                BidHistoryModel(name: "Tono",  price: 9_350_000,  createdAt: .daysAgo(4, hour: 9,  minute: 50)),
                BidHistoryModel(name: "Ricko", price: 9_700_000,  createdAt: .daysAgo(4, hour: 18, minute: 27)),
                BidHistoryModel(name: "Fajar", price: 9_850_000,  createdAt: .daysAgo(3, hour: 7,  minute: 15)),
                BidHistoryModel(name: "Dewi",  price: 10_100_000, createdAt: .daysAgo(3, hour: 20, minute: 40)),
                BidHistoryModel(name: "Bagus", price: 10_200_000, createdAt: .daysAgo(2, hour: 10, minute: 22)),
                BidHistoryModel(name: "Tono",  price: 10_600_000, createdAt: .daysAgo(2, hour: 17, minute: 55)),
                BidHistoryModel(name: "Fajar", price: 10_750_000, createdAt: .daysAgo(1, hour: 8,  minute: 30)),
                BidHistoryModel(name: "Dewi",  price: 11_000_000, createdAt: .daysAgo(1, hour: 15, minute: 18)),
                BidHistoryModel(name: "Ricko", price: 11_150_000, createdAt: .daysAgo(0, hour: 9,  minute: 5)),
                BidHistoryModel(name: "Tono",  price: 11_500_000, createdAt: .daysAgo(0, hour: 13, minute: 42)),
            ]
        ),
        BidItemModel(
            name: "Adidas Samba OG 'Cloud White'",
            description: "Adidas Samba OG in the iconic Cloud White & Core Black colorway. Size US 8.5, deadstock, never worn. Complete with original box and purchase receipt. One of the most sought-after silhouettes this year.",
            imageUrl: UIImage(named: "adidas_samba_og_white"),
            bidder: "Rafi",
            bidOpenPrice: 1_800_000,
            bidOpensAt: Date(),
            bidClosesAt: .daysFromNow(7),
            history: []
        )
    ]
}
