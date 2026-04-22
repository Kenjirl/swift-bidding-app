//
//  Dummy.swift
//  bidding-app
//
//  Created by I Gusti Ngurah Bagus Ferry Mahayudha on 21/04/26.
//

import Foundation
import Observation
import Combine

@Observable
class MockData {
    var allItems: [BidItemModel] = BidItemData.bidItems
}

