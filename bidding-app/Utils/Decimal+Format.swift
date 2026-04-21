//
//  Decimal+Format.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 20/04/26.
//

import Foundation

extension Decimal {
    func toCompactString() -> String {
        let double = NSDecimalNumber(decimal: self).doubleValue
        
        func format(_ value: Double) -> String {
            value.truncatingRemainder(dividingBy: 1) == 0
                ? String(format: "%.0f", value)
                : String(format: "%.2f", value)
        }
        
        switch double {
        case 1_000_000_000...:
            return "\(format(double / 1_000_000_000))B"
        case 1_000_000...:
            return "\(format(double / 1_000_000))M"
        case 1_000...:
            return "\(format(double / 1_000))K"
        default:
            return String(format: "%.0f", double)
        }
    }
    
    func toCurrencyString() -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = ","
            formatter.decimalSeparator = "."
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 0
            return formatter.string(from: NSDecimalNumber(decimal: self)) ?? "\(self)"
        }
}
