//
//  BidItemDetailView.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 20/04/26.
//

import SwiftUI
import Charts

struct BidItemDetailView: View {
    
    @Binding var item: BidItemModel
    var title: String
    
    @State private var showDetailItemSheet = false
    @State private var showCreateBidSheet = false
    @State private var selectedBid: BidHistoryModel? = nil
    @State private var chartShowed = "Daily Bid Count"
    @State private var createBidSuccessAlert = false
    
    func countBidHistory(history: [BidHistoryModel]) -> Bool {
        if (history.count == 0) { return false }
        return true
    }

    var body: some View {
        ScrollView {
            /// Item Card
            VStack {
                HStack {
                    ZStack {
                        Image(item.imageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        HStack(spacing: 4) {
                            Image(systemName: "clock")
                            Text(item.bidClosesAt.timeRemainingString())
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 16)
                        .background(.green)
                        .cornerRadius(6)
                        .foregroundStyle(.white)
                        .font(.caption)
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding(8)
                    }
                    
                    VStack {
                        Spacer()
                        
                        Text("Current Bid")
                            .fontWeight(.thin)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(item.findHighestBid()?.toCompactString() ?? item.bidOpenPrice.toCompactString())")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.green)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                }
                .padding(.bottom, 4)
                
                Text("\(item.name)")
                    .font(.title2)
                
                Text("\(item.description)")
                    .font(.caption)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                
                Button("More Info") { showDetailItemSheet = true }
                    .font(.caption)
                    .fontWeight(.light)
                    .sheet(isPresented: $showDetailItemSheet) {
                        MoreInfoSheet(item: item)
                    }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()

            /// Chart
            if (countBidHistory(history: item.history)) {
                VStack {
                    HStack {
                        Menu {
                            Button("Daily Bid Count") {
                                chartShowed = "Daily Bid Count"
                            }
                            Button("Bid Price") {
                                chartShowed = "Bid Price"
                            }
                        } label: {
                            HStack(spacing: 4) {
                                Image(systemName: "chevron.up.chevron.down")
                                Text(chartShowed)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                            .font(.footnote)
                        }
                        .foregroundStyle(.primary)
                    }
                    .padding(.bottom, 4)
                    
                    if (chartShowed == "Daily Bid Count") { DailyBidCountChart(item: item) }
                    else { BidPriceChart(item: item) }
                }
                .padding()
            }

            /// Bid History
            VStack {
                HStack {
                    Text("Bid so far").bold()
                    Spacer()
                    
                    if title != "My Items" {
                        Button ("Place Bid") { showCreateBidSheet = true }
                    }
                    
                }
                .sheet(isPresented: $showCreateBidSheet) {
                    let highestBid = item.findHighestBid() ?? item.bidOpenPrice
                    CreateBidSheet(
                        history: $item.history,
                        highestBid: highestBid,
                        onSuccess: { createBidSuccessAlert = true }
                    )
                }
                .alert("Bid Placed!", isPresented: $createBidSuccessAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text("Your bid has been successfully placed.")
                }
                
                if (countBidHistory(history: item.history)) {
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
                } else {
                    Text("No Bid History Yet")
                        .padding(.top)
                        .font(.default)
                        .fontWeight(.light)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    @Previewable @State var item = BidItemData.bidItems[0]
    @Previewable @State var title = "title"
    BidItemDetailView(item: $item, title: title)
}
