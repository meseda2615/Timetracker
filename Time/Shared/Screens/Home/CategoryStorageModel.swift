//
//  CategoryModel.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 21.01.2022.
//

import Foundation





// User Storage
struct CategoryStorageModel {
    
    var date: Date = Date()
    // category and tracked seconds
    var data: [String: Double] = [:]
    
}

extension CategoryStorageModel: Codable {}


// State model for View
struct CategoryStateModel {
 
    var data: [TimeCategoryModel] = [
        
        .init(category: .sleep, resultTime: "0",isSelected: true),
        .init(category: .work, resultTime: "0"),
        .init(category: .education, resultTime: "0"),
        .init(category: .health, resultTime: "0"),
        .init(category: .family, resultTime: "0"),
        .init(category: .mix, resultTime: "0")
    ]
    
    var date: Date = Date()
    var totalResult: String = ""
}
