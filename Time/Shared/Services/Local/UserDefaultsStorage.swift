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
