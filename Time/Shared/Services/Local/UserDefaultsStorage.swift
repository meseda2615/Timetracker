//
//  UserDefaultsStorage.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 20.01.2022.
//

import Foundation


final class UserStorageService {
    
    private let defaults = UserDefaults.standard
    
    enum Keys {
        enum OnBoarding {
            static let seenKey = "seenKey"
        }
        
        enum CategorySleep {
            static let showedSleep = "showedSleep"
        }
        
        enum Category {
            static let category = "category"
        }
    }

    
}

// MARK: - OnBoarding
extension UserStorageService {
    
    func getIsOnBoardingSeen() -> Bool {
        return defaults.bool(forKey: Keys.OnBoarding.seenKey)
    }
    
    func setIsonBoardingSeen() {
        defaults.setValue(true, forKey: Keys.OnBoarding.seenKey)
    }
}

// MARK: - IsNeedToShowSleepScreenToday
extension UserStorageService {
    
    func getShowedSleepDate() -> String? {
        return defaults.string(forKey: Keys.CategorySleep.showedSleep)
    }
    
    func setDateShowedSleepScreen(date: String) {
        
        print("Date",date)
        defaults.set(date, forKey: Keys.CategorySleep.showedSleep)
        
    }
}

// MARK: - Save TrackedTime by Category
extension UserStorageService {
    
    
    func getTodayCategoryModel() -> CategoryStorageModel {
        // try to get category and if category with today date we can update this
        if
            let model =  try? defaults.get(objectType: CategoryStorageModel.self, forKey: Keys.Category.category),
            model.date.isToday()
        {
            
            return model
        }
        
        // if not create new category with today date
        return CategoryStorageModel()
        
    }
    
    
    func updateCategoryModel(category: TimeCategory, seconds: Double) {
        var model = getTodayCategoryModel()
        
        if let prevresult = model.data[category.rawValue]  {
            model.data[category.rawValue]  = prevresult + seconds
        } else {
            model.data[category.rawValue] = seconds
        }
        
        saveCategoryModel(category: model)
    }
    func updateCategoryModel(selectedCategory: String) {
        var model = getTodayCategoryModel()
        
        model.selectedCategory = selectedCategory
        
        saveCategoryModel(category: model)
    }
    
    
    func saveCategoryModel(category: CategoryStorageModel) {
        
        try? defaults.set(object: category, forKey: Keys.Category.category)
    }
    
    func clearModel() {
        try? defaults.removeObject(forKey: Keys.Category.category)
    }
    
    func clearSelectedCategory(category: TimeCategory) {
        
        print("Clear selected category", category)
        var model = getTodayCategoryModel()
  
        if model.data.keys.contains(category.rawValue) {
            
            model.data[category.rawValue] = nil
        }
        
        saveCategoryModel(category: model)
    }
}
