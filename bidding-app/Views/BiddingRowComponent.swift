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
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray.opacity(0.1))
                    .frame(width: 50, height: 50)
                    .overlay(Text("👟"))
                
                Text(item.name).font(.headline)
                Spacer()
                
                // Mini Trend Chart
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
                
                Text(item.history.last?.price.toCompactString() ?? item.bidOpenPrice.toCompactString())
                    .font(.subheadline).fontWeight(.semibold)
            }
            Text("Ends: \(item.bidClosesAt.formatted(date: .long, time: .omitted))")
                .font(.caption2).foregroundColor(.secondary)
        }
    }
    
    // Move the prepareChartData logic here inside the component
    private func prepareChartData(for item: BidItemModel) -> [ChartData] {
        
        // 1. Group the existing history as you did before
        let grouped = Dictionary(grouping: item.history) {
            Calendar.current.startOfDay(for: $0.createdAt)
        }
        
        // 2. Find the start and end dates of your history
        // If no history, return empty
        guard let firstDate = item.history.map({ $0.createdAt }).min(),
              let lastDate = item.history.map({ $0.createdAt }).max() else {
            return []
        }
        
        let start = Calendar.current.startOfDay(for: firstDate)
        let end = Calendar.current.startOfDay(for: lastDate)
        
        var allDays: [ChartData] = []
        var currentDay = start
        
        // 3. Loop through every day from start to end
        while currentDay <= end {
            // If we have data for this day, use the count. Otherwise, use 0.
            let count = grouped[currentDay]?.count ?? 0
            allDays.append(ChartData(date: currentDay, count: count))
            
            // Advance to the next day
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
