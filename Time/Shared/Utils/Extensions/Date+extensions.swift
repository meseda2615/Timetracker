//
//  Date+extensions.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 25.01.2022.
//

import Foundation
extension Date {
    
    
    public var dayOfYear: UInt {
        let range = NSCalendar.current.range(of: .day, in: .year, for: self as Date)
        return UInt(range!.count)
    }
    
   
    
    // MARK: - Compute Date as String
    public func toString(format: String = "yyyy-MM-dd HH:mm:ss", timezone: TimeZone? = nil, local: String = "en_US") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: local)
        if let tz = timezone {
            formatter.timeZone = tz
        }
        return formatter.string(from: self as Date)
    }

    static func parseUTC(dateString: String, format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: dateString)
    }
    
    // MARK: - Class Functions
    static func parse(dateString: String, format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US")
        return formatter.date(from: dateString)
    }
    
    static func parseDate(dateString: String, format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: dateString)
    }
    
    public var clampedDate: Date {
        let referenceTimeInterval = self.timeIntervalSinceReferenceDate
        let remainingSeconds = referenceTimeInterval.truncatingRemainder(dividingBy: TimeInterval(15*60))
        let timeRoundedToInterval = referenceTimeInterval - remainingSeconds
        return Date(timeIntervalSinceReferenceDate: timeRoundedToInterval)
    }
    
    var zeroSeconds: Date? {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: self)
        return calendar.date(from: dateComponents)
    }
    
    // Convert local time to UTC (or GMT)
    func toGlobalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = -TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }

    // Convert UTC (or GMT) to local time
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
}
