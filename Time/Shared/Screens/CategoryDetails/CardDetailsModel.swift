//
//  CardDetailsModel.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 21.01.2022.
//

import SwiftUI


// MARK: - Model

enum TimeFilter: String {
    case sixHours = "6 hours"
    case sevenHours = "7 hours"
    case eightHours = "8 hours"
    
    
    case thirtyMin = "30 min"
    case oneHour = "1 hour"
    case twoHours = "2 hours"
    
    
    case other = "Other"
    
}

struct TimeFilterModel {
    var value: TimeFilter
    var color: Color
    var isSelected: Bool = false
}


// Need to make here state
// and update only state in View
// like MVI model
