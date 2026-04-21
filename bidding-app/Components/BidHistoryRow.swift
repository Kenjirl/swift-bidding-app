//
//  BidHistoryRow.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 20/04/26.
//

import SwiftUI

struct BidHistoryRow: View {
    let bid: BidHistoryModel
    let increment: Decimal
    
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
            }
            .frame(width: 50, height: 50, alignment: .center)
            .background(.gray)
            .clipShape(Circle())
            
            VStack {
                Text("\(bid.name)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.subheadline)
                    .bold()
                
                Text("placed at \(bid.createdAt.toFormattedString())")
                    .font(.caption2)
                    .fontWeight(.thin)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("+ Rp \(increment.toCompactString())")
                .font(.caption)
                .foregroundStyle(.green)
        }
        .listRowInsets(EdgeInsets())
        .padding(.vertical)
    }
}
