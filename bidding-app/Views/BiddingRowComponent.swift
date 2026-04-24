//
//  BiddingRowComponent.swift
//  bidding-app
//
//  Created by I Gusti Ngurah Bagus Ferry Mahayudha on 21/04/26.
//

import SwiftUI
import Charts

struct BiddingRowComponent: View {
    let item: BidItemModel
    
    var body: some View {
        let chartData = prepareChartData(for: item)
        
        VStack(alignment: .leading) {
            if (chartData.last?.count ?? 0) > 2 {
                Text("ON TRENDS!")
                    .font(.caption2).fontWeight(.bold).foregroundColor(.orange)
            }
            
            HStack {
                Image(uiImage: item.imageUrl ?? UIImage(named: "default")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Text(item.name)
                    .font(.headline)
                    .lineLimit(2)
                Spacer()
                
                // Mini Trend Chart
                if (item.hasHistory) {
                    Chart(chartData) { data in
                        AreaMark(x: .value("Day", data.date, unit: .day), y: .value("Count", data.count))
                            .foregroundStyle(.blue.opacity(0.1))
                            .interpolationMethod(.catmullRom)
                        LineMark(x: .value("Day", data.date, unit: .day), y: .value("Count", data.count))
                            .foregroundStyle(.blue)
                            .interpolationMethod(.catmullRom)
                    }
                    .frame(width: 80, height: 40)
                    .chartXAxis(.hidden).chartYAxis(.hidden)
                }
                
                VStack(spacing: 4) {
                    VStack {
                        Text(item.history.last?.price.toCompactString() ?? item.bidOpenPrice.toCompactString())
                            .font(.subheadline).fontWeight(.semibold)
                            .padding(0)
                    }
                    
                    Text("\(item.bidStatus.rawValue)")
                        .font(.caption2)
                        .bold()
                        .frame(maxWidth: 60)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 6)
                        .foregroundStyle(.white)
                        .background(
                            item.bidStatus == BidStatus.open ? .green : .gray
                        )
                        .cornerRadius(6)
                }
            }
        }
    }
    
    private func prepareChartData(for item: BidItemModel) -> [ChartData] {
        
        let grouped = Dictionary(grouping: item.history) {
            Calendar.current.startOfDay(for: $0.createdAt)
        }
        
        guard let firstDate = item.history.map({ $0.createdAt }).min(),
              let lastDate = item.history.map({ $0.createdAt }).max() else {
            return []
        }
        
        let start = Calendar.current.startOfDay(for: firstDate)
        let end = Calendar.current.startOfDay(for: lastDate)
        
        var allDays: [ChartData] = []
        var currentDay = start
        
        while currentDay <= end {
            let count = grouped[currentDay]?.count ?? 0
            allDays.append(ChartData(date: currentDay, count: count))
            
            if let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: currentDay) {
                currentDay = nextDay
            } else {
                break
            }
        }
        
        return allDays
    }
}

struct ChartData: Identifiable {
    
    let id = UUID()
    let date: Date
    let count: Int
    
}

#Preview {
    @Previewable @State var item = BidItemData.bidItems[0]
    BiddingRowComponent(item: item)
}
