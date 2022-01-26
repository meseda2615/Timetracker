//
//  Int+extensions.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 26.01.2022.
//

import Foundation
extension Int {
    static func parse(from string: String) -> Int? {
        return Int(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
    }
    
    func toDouble() -> Double {
        Double(self)
    }
    
    func hourseToSeconds() -> Double {
        Double(self * 3600)
    }
    
    func minutesToSeconds() -> Double {
        Double(self * 60)
    }
}
