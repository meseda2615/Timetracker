//
//  CategoryState.swift
//  Time
//
//  Created by Павел Мишагин on 27.01.2022.
//

import Foundation


struct CategoryState {
    
    var model =  CategoryStateModel()
}
// State
enum TimeCategory: String {
    
    
    case sleep
    case work
    case education
    case health
    case family
    case mix
}

struct TimeCategoryModel: Identifiable {
    var id = UUID().uuidString
    var category: TimeCategory
    var resultTime: String
    var isSelected: Bool = false
    
    var imageString : String {
        var res: String
        switch category {
        case .sleep:
            res = "img_cat_sleep"
        case .work:
            res =  "im_cat_work"
        case .education, .family:
            res = "img_cat_education_family"
        case .health, .mix:
            res = "img_cat_mix_health"
 
        }
        
        return res
    }
}
