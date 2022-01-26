//
//  Double+extensions.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 26.01.2022.
//

import Foundation
extension Double {
  func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second, .nanosecond]
    formatter.unitsStyle = style
    return formatter.string(from: self) ?? ""
  }
}
