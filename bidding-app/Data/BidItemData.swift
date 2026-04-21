//
//  BidItemData.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 17/04/26.
//

import Foundation

struct BidItemData {
    static let bidItems: [BidItemModel] = [
        BidItemModel(
            name: "Nike Air Jordan 1 Retro High OG",
            description: "Sneaker ikonik dengan colorway Chicago klasik. Kondisi deadstock, belum pernah dipakai. Dilengkapi box original dan semua aksesori.",
            imageUrl: "nike_air_jordan_1",
            bidOpenPrice: 2_500_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(1),
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
        ),
        BidItemModel(
            name: "Adidas Yeezy Boost 350 V2 Zebra",
            description: "Yeezy 350 V2 colorway Zebra, ukuran 42. Authentic 100%, sudah di-legit check. Box original masih mulus.",
            imageUrl: "adidas_yeezy_350_zebra",
            bidOpenPrice: 3_000_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(2),
            history: [
                BidHistoryModel(name: "YeezyFan_Riko",      price: 3_150_000,  createdAt: .daysAgo(7, hour: 10, minute: 20)),
                BidHistoryModel(name: "KickCollector_Andi", price: 3_500_000,  createdAt: .daysAgo(7, hour: 22, minute: 5)),
                BidHistoryModel(name: "SneakerVault_Tono",  price: 3_650_000,  createdAt: .daysAgo(6, hour: 13, minute: 47)),
                BidHistoryModel(name: "YeezyFan_Riko",      price: 4_000_000,  createdAt: .daysAgo(5, hour: 9,  minute: 30)),
                BidHistoryModel(name: "NB_Lovers_Sari",     price: 4_100_000,  createdAt: .daysAgo(5, hour: 17, minute: 55)),
                BidHistoryModel(name: "KickCollector_Andi", price: 4_350_000,  createdAt: .daysAgo(4, hour: 8,  minute: 12)),
                BidHistoryModel(name: "HypeKick_Fajar",     price: 4_700_000,  createdAt: .daysAgo(4, hour: 21, minute: 38)),
                BidHistoryModel(name: "YeezyFan_Riko",      price: 4_800_000,  createdAt: .daysAgo(3, hour: 11, minute: 5)),
                BidHistoryModel(name: "RareFinds_Dewi",     price: 5_100_000,  createdAt: .daysAgo(3, hour: 16, minute: 50)),
                BidHistoryModel(name: "SneakerVault_Tono",  price: 5_150_000,  createdAt: .daysAgo(2, hour: 7,  minute: 22)),
                BidHistoryModel(name: "KickCollector_Andi", price: 5_500_000,  createdAt: .daysAgo(2, hour: 19, minute: 40)),
                BidHistoryModel(name: "YeezyFan_Riko",      price: 5_650_000,  createdAt: .daysAgo(1, hour: 10, minute: 15)),
                BidHistoryModel(name: "HypeKick_Fajar",     price: 5_900_000,  createdAt: .daysAgo(1, hour: 14, minute: 33)),
                BidHistoryModel(name: "NB_Lovers_Sari",     price: 6_050_000,  createdAt: .daysAgo(0, hour: 8,  minute: 48)),
                BidHistoryModel(name: "SneakerVault_Tono",  price: 6_400_000,  createdAt: .daysAgo(0, hour: 11, minute: 5)),
            ]
        ),
        BidItemModel(
            name: "New Balance 550 White Green",
            description: "New Balance 550 kolaborasi eksklusif. Ukuran 41, kondisi 9/10, dipakai hanya 2x. Cocok untuk daily wear maupun koleksi.",
            imageUrl: "new_balance_550_white_green",
            bidOpenPrice: 1_200_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(0, hour: 12),
            history: [
                BidHistoryModel(name: "NB_Lovers_Sari",     price: 1_350_000,  createdAt: .daysAgo(7, hour: 8,  minute: 10)),
                BidHistoryModel(name: "RareFinds_Dewi",     price: 1_500_000,  createdAt: .daysAgo(6, hour: 20, minute: 35)),
                BidHistoryModel(name: "KickCollector_Andi", price: 1_900_000,  createdAt: .daysAgo(6, hour: 23, minute: 50)),
                BidHistoryModel(name: "NB_Lovers_Sari",     price: 2_050_000,  createdAt: .daysAgo(5, hour: 12, minute: 5)),
                BidHistoryModel(name: "SneakerHead_Budi",   price: 2_200_000,  createdAt: .daysAgo(5, hour: 18, minute: 22)),
                BidHistoryModel(name: "RareFinds_Dewi",     price: 2_600_000,  createdAt: .daysAgo(4, hour: 9,  minute: 47)),
                BidHistoryModel(name: "HypeKick_Fajar",     price: 2_700_000,  createdAt: .daysAgo(3, hour: 14, minute: 30)),
                BidHistoryModel(name: "NB_Lovers_Sari",     price: 2_850_000,  createdAt: .daysAgo(3, hour: 22, minute: 15)),
                BidHistoryModel(name: "YeezyFan_Riko",      price: 3_100_000,  createdAt: .daysAgo(2, hour: 7,  minute: 55)),
                BidHistoryModel(name: "KickCollector_Andi", price: 3_250_000,  createdAt: .daysAgo(2, hour: 16, minute: 40)),
                BidHistoryModel(name: "NB_Lovers_Sari",     price: 3_600_000,  createdAt: .daysAgo(1, hour: 10, minute: 20)),
                BidHistoryModel(name: "SneakerVault_Tono",  price: 3_700_000,  createdAt: .daysAgo(1, hour: 19, minute: 5)),
                BidHistoryModel(name: "RareFinds_Dewi",     price: 3_950_000,  createdAt: .daysAgo(0, hour: 6,  minute: 33)),
                BidHistoryModel(name: "HypeKick_Fajar",     price: 4_100_000,  createdAt: .daysAgo(0, hour: 9,  minute: 18)),
                BidHistoryModel(name: "NB_Lovers_Sari",     price: 4_350_000,  createdAt: .daysAgo(0, hour: 10, minute: 45)),
            ]
        ),
        BidItemModel(
            name: "Nike SB Dunk Low Travis Scott",
            description: "Kolaborasi langka Nike SB Dunk Low x Travis Scott. Ukuran 43, deadstock. Sertifikat keaslian tersedia. Harga pasar terus naik.",
            imageUrl: "nike_sb_dunk_travis_scott",
            bidOpenPrice: 8_000_000,
            bidOpensAt: .daysAgo(7),
            bidClosesAt: .daysFromNow(3),
            history: [
                BidHistoryModel(name: "HypeKick_Fajar",     price: 8_150_000,  createdAt: .daysAgo(7, hour: 11, minute: 20)),
                BidHistoryModel(name: "SneakerVault_Tono",  price: 8_500_000,  createdAt: .daysAgo(7, hour: 19, minute: 45)),
                BidHistoryModel(name: "KickCollector_Andi", price: 8_650_000,  createdAt: .daysAgo(6, hour: 8,  minute: 10)),
                BidHistoryModel(name: "HypeKick_Fajar",     price: 9_000_000,  createdAt: .daysAgo(6, hour: 22, minute: 33)),
                BidHistoryModel(name: "RareFinds_Dewi",     price: 9_200_000,  createdAt: .daysAgo(5, hour: 13, minute: 5)),
                BidHistoryModel(name: "SneakerVault_Tono",  price: 9_350_000,  createdAt: .daysAgo(4, hour: 9,  minute: 50)),
                BidHistoryModel(name: "YeezyFan_Riko",      price: 9_700_000,  createdAt: .daysAgo(4, hour: 18, minute: 27)),
                BidHistoryModel(name: "HypeKick_Fajar",     price: 9_850_000,  createdAt: .daysAgo(3, hour: 7,  minute: 15)),
                BidHistoryModel(name: "SneakerHead_Budi",   price: 10_100_000, createdAt: .daysAgo(3, hour: 20, minute: 40)),
                BidHistoryModel(name: "KickCollector_Andi", price: 10_200_000, createdAt: .daysAgo(2, hour: 10, minute: 22)),
                BidHistoryModel(name: "SneakerVault_Tono",  price: 10_600_000, createdAt: .daysAgo(2, hour: 17, minute: 55)),
                BidHistoryModel(name: "HypeKick_Fajar",     price: 10_750_000, createdAt: .daysAgo(1, hour: 8,  minute: 30)),
                BidHistoryModel(name: "RareFinds_Dewi",     price: 11_000_000, createdAt: .daysAgo(1, hour: 15, minute: 18)),
                BidHistoryModel(name: "YeezyFan_Riko",      price: 11_150_000, createdAt: .daysAgo(0, hour: 9,  minute: 5)),
                BidHistoryModel(name: "SneakerVault_Tono",  price: 11_500_000, createdAt: .daysAgo(0, hour: 13, minute: 42)),
            ]
        )
    ]
}
