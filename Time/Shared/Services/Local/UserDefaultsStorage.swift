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
