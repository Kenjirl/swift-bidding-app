//
//  DailyBidCountChart.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 21/04/26.
//

import SwiftUI
import Charts

struct DailyBidCountChart: View {
    let item: BidItemModel
    
    var chartDailyBidCountData: [(date: Date, count: Int)] {
        Dictionary(grouping: item.history, by: { Calendar.current.startOfDay(for: $0.createdAt) })
            .map { (date, bids) in (date: date, count: bids.count) }
            .sorted { $0.date < $1.date }
    }
    
    var body: some View {
        Chart(chartDailyBidCountData, id: \.date) {
            AreaMark(
                x: .value("Tanggal", $0.date, unit: .day),
                y: .value("Jumlah Bid", $0.count)
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
                x: .value("Tanggal", $0.date, unit: .day),
                y: .value("Jumlah Bid", $0.count)
            )
            .foregroundStyle(.blue)
            .lineStyle(StrokeStyle(lineWidth: 1))
            .interpolationMethod(.catmullRom)
            
            PointMark(
                x: .value("Tanggal", $0.date, unit: .day),
                y: .value("Jumlah Bid", $0.count)
            )
            .foregroundStyle(.blue)
            .symbolSize(40)
        }
        .frame(height: 200)
    }
}

#Preview {
    DailyBidCountChart(item: BidItemData.bidItems[0])
}
