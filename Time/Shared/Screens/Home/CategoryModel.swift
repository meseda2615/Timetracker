//
//  CategoryModel.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 21.01.2022.
//

import Foundation


enum TimeCategory: String {
    
    
    case sleep
    case work
    case education
    case health
    case family
    case mix
}


struct CategoryModel {
    
    var date: Date = Date()
    // category and tracked seconds
    var data: [String: Double] = [:]
}

extension CategoryModel: Codable {}
