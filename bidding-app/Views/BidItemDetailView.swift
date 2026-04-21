//
//  BidItemDetailView.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 20/04/26.
//

import SwiftUI
import Charts

struct BidItemDetailView: View {
    @State private var showPlaceBidSheet = false
    @State private var selectedBid: BidHistoryModel? = nil
    
    let item: BidItemModel
    
    var chartData: [(date: Date, count: Int)] {
        Dictionary(grouping: item.history, by: { Calendar.current.startOfDay(for: $0.createdAt) })
            .map { (date, bids) in (date: date, count: bids.count) }
            .sorted { $0.date < $1.date }
    }

    var body: some View {
        ScrollView {
            /// Item Card
            VStack {
                HStack {
                    Image(item.imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack {
                        Spacer()
                        
                        Text("Current Bid")
                            .fontWeight(.thin)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Rp \n\(item.findHighestBid()?.toCompactString() ?? item.bidOpenPrice.toCompactString())")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.green)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                }
                .padding(.bottom)
                
                Text("\(item.name)")
                    .font(.title2)
                    .bold()
                
                Text("\(item.description)")
                    .font(.caption)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()

            /// Chart
            VStack {
                Chart(chartData, id: \.date) {
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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: .infinity, height: 200)
            .padding()

            /// Bid History
            VStack {
                HStack {
                    Text("Bid so far").bold()
                    Spacer()
                    Button ("Place Bid") { showPlaceBidSheet = true }
                }
                
                List {
                    ForEach(item.historyWithIncrement.reversed(), id: \.history.id) { bid in
                        BidHistoryRow(bid: bid.history, increment: bid.increment)
                            .onTapGesture {
                                selectedBid = bid.history
                            }
                    }
                }
                .frame(width: .infinity, height: 500, alignment: .top)
                .listStyle(.plain)
                .sheet(item: $selectedBid) { bid in
                    let index = item.history.firstIndex(where: { $0.id == bid.id })
                    let previousBid = index.flatMap { $0 > 0 ? item.history[$0 - 1].price : nil }
                    let highestBid = item.findHighestBid() ?? item.bidOpenPrice

                    BidHistoryDetailSheet(
                        bid: bid,
                        highestBid: highestBid,
                        previousBid: previousBid
                    )
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    BidItemDetailView(item: BidItemData.bidItems[0])
}
