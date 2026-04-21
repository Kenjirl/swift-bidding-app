//
//  bidding_appApp.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 17/04/26.
//

import SwiftUI

@main
struct bidding_appApp: App {
    var body: some Scene {
        WindowGroup {
            BidItemDetailView(item: BidItemData.bidItems[0])
        }
    }
}
