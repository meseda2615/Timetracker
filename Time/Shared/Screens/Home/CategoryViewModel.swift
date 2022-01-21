//
//  CategoryViewModel.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 21.01.2022.
//

import Foundation


final class CategoryViewModel:  ObservableObject {
    
    // reRender View when set new value  wich contains this ViewModel like ObservedObject
    
    
    private let userDefaultsStorage: UserStorageService?
    
    init(userDefaultsStorage: UserStorageService?) {
        self.userDefaultsStorage = userDefaultsStorage
        
        
    }
    
    
}

// MARK: - Show Sleep Screen Logic

extension CategoryViewModel {
    
}
