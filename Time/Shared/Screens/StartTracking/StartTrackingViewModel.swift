//
//  StartTrackingViewModel.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 28.01.2022.
//

import Foundation


extension StartTrackingScreenView {
    
    class ViewModel: ObservableObject {
        
        private let userDefaultsStorage: UserStorageService?
        init(userDefaultsStorage: UserStorageService? = ServiceLocator.shared.getService()) {
            self.userDefaultsStorage = userDefaultsStorage
        }
        
        func saveTimeToCategory(category: TimeCategory, seconds: Double) {
            userDefaultsStorage?.updateCategoryModel(category: category, seconds: seconds)
        }
    }
}
