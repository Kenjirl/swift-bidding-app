//
//  BidPriceChart.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 21/04/26.
//

import SwiftUI
import Charts

struct BidPriceChart: View {
    let item: BidItemModel
    
    var chartBidPriceData: [(date: Date, price: Decimal)] {
        item.history
            .sorted { $0.createdAt < $1.createdAt }
            .map { (date: $0.createdAt, price: $0.price) }
    }
    
    var body: some View {
        Chart(chartBidPriceData, id: \.date) {
            AreaMark(
                x: .value("Tanggal", $0.date, unit: .second),
                y: .value("Jumlah Bid", $0.price)
            )
            .foregroundStyle(
                LinearGradient(
                    colors: [.blue.opacity(0.4), .blue.opacity(0.0)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .interpolationMethod(.catmullRom)
            
            LineMark(
                x: .value("Tanggal", $0.date, unit: .second),
                y: .value("Jumlah Bid", $0.price)
            )
            .foregroundStyle(.blue)
            .lineStyle(StrokeStyle(lineWidth: 1))
            .interpolationMethod(.catmullRom)
        }
        .frame(height: 200)
    }
}

#Preview {
    BidPriceChart(item: BidItemData.bidItems[0])
}
