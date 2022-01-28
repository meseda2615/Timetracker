//
//  CategoryAction.swift
//  Time
//
//  Created by Павел Мишагин on 27.01.2022.
//

import Foundation


enum CategoryAction {
    case onAppear
    case onSelectItem(item: TimeCategoryModel)
    case startToTrack
    case clearDay
    case clearSeelctedCategory
}
