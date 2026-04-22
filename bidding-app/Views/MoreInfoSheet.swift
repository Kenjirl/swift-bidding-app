//
//  MoreInfoSheet.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 23/04/26.
//

import SwiftUI

struct MoreInfoSheet: View {
    var item: BidItemModel
    
    func getCurrentPrice(item: BidItemModel) -> Decimal {
        if (item.history.isEmpty) { return item.bidOpenPrice }
        return item.history[item.history.count - 1].price
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack {
                        Text("Item")
                            .fontWeight(.thin)
                        Spacer()
                        Text(item.name)
                    }
                    .frame(alignment: .leading)
                    
                    HStack {
                        Text("Bidder")
                            .fontWeight(.thin)
                        Spacer()
                        Text(item.bidder)
                    }
                    .frame(alignment: .leading)
                    
                    HStack {
                        Text("Open Price")
                            .fontWeight(.thin)
                        Spacer()
                        Text("Rp \(item.bidOpenPrice.toCurrencyString())")
                    }
                    .frame(alignment: .leading)
                    
                    HStack {
                        Text("Current Price")
                            .fontWeight(.thin)
                        Spacer()
                        Text("Rp \(getCurrentPrice(item: item).toCurrencyString())")
                    }
                    .frame(alignment: .leading)
                    
                    HStack {
                        Text("Starts at")
                            .fontWeight(.thin)
                        Spacer()
                        Text(item.bidOpensAt.toFormattedStringWithTime())
                    }
                    .frame(alignment: .leading)
                    
                    HStack {
                        Text("Ends at")
                            .fontWeight(.thin)
                        Spacer()
                        Text(item.bidClosesAt.toFormattedStringWithTime())
                    }
                    .frame(alignment: .leading)
                }
                .frame(alignment: .leading)
                
                Spacer()
            }
            .frame(alignment: .leading)
            .padding()
            .presentationDetents([.medium])
            .navigationTitle("Item Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    @Previewable @State var item = BidItemData.bidItems[0]
    
    MoreInfoSheet(item: item)
}
