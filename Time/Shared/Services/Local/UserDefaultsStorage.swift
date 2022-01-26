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
    
    
    func getTodayCategoryModel() -> CategoryModel? {
        if let category =  try? defaults.get(objectType: CategoryModel.self, forKey: Keys.Category.category) {
            return category
        }
        return nil
        
    }
    
    func saveCategoryModel(category: CategoryModel) {
        
        try? defaults.set(object: category, forKey: Keys.Category.category)
    }
}
