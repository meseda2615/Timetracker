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
}
