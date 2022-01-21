//
//  MainViewModel.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 20.01.2022.
//

import SwiftUI
import Combine


final class MainViewModel:  ObservableObject {
    
    @Published var hasOnboardingSeen: Bool = false
    
    
    private let userDefaultsStorage: UserStorageService?
    
    init(userDefaultsStorage: UserStorageService?) {
        self.userDefaultsStorage = userDefaultsStorage
        
        hasOnboardingSeen = userDefaultsStorage?.getIsOnBoardingSeen() ?? false
    }
    
    
    
    
    func setSeenOnBoarding() {
        userDefaultsStorage?.setIsonBoardingSeen()
        hasOnboardingSeen = true
        
    }
    
    
}
