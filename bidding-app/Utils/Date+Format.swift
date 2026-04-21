//
//  Date+Format.swift
//  bidding-app
//
//  Created by Benedict Kenjiro Lehot on 20/04/26.
//

import Foundation

extension Date {
    func toFormattedString() -> String {
        return self.formatted(
            .dateTime
                .month(.wide)
                .day()
                .year()
            .locale(Locale(identifier: "en_US")))
    }
    
    func toFormattedStringWithTime() -> String {
        return self.formatted(
            .dateTime
                .month(.wide)
                .day()
                .year()
                .hour()
                .minute()
                .locale(Locale(identifier: "en_US"))
        )
    }
    
    static func daysAgo(_ days: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) -> Date {
            var components = DateComponents()
            components.day = -days
            components.hour = hour
            components.minute = minute
            components.second = second
            return Calendar.current.date(byAdding: components, to: Date())!
        }

        static func daysFromNow(_ days: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) -> Date {
            var components = DateComponents()
            components.day = days
            components.hour = hour
            components.minute = minute
            components.second = second
            return Calendar.current.date(byAdding: components, to: Date())!
        }
}
