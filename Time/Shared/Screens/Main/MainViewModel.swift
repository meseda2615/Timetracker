//
//  MainViewModel.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 20.01.2022.
//

import SwiftUI
import Combine


final class MainViewModel:  ObservableObject {
    
    // reRender View when set new value  wich contains this ViewModel like ObservedObject
    @Published var hasOnboardingSeen: Bool = false
    @Published var isNeedToShowSleepScreen: Bool = false
    
    
    private let userDefaultsStorage: UserStorageService?
    
    init(userDefaultsStorage: UserStorageService?) {
        self.userDefaultsStorage = userDefaultsStorage
        
        hasOnboardingSeen = getIsOnBoardingSeen()
    }
    
    
    
}

// MARK: - OnBoarding

extension MainViewModel {
    
    
    private func getIsOnBoardingSeen() -> Bool {
        userDefaultsStorage?.getIsOnBoardingSeen() ?? false
    }
    
    func setSeenOnBoarding() {
        userDefaultsStorage?.setIsonBoardingSeen()
        hasOnboardingSeen = true
        
    }
}

// MARK: - Show Sleep Screen
extension MainViewModel {
    
    func checkIfNeedShowSleepScreenToday() -> Bool {
        
        print("Check if needed Sleep Screen")
        
        
        let now =  Date()
        
        let showedDateString = userDefaultsStorage?.getShowedSleepDate()
        
        
        // if we cant get data form here
        if showedDateString == nil {
            saveDate(date: now.toString())
            return true
        }
        
        
        // if we get date showed day not today need to show sleep screen and save today date
        if
            let showedDate = Date.parse(dateString: showedDateString!),
            showedDate.isToday() == false {
            
            saveDate(date: now.toString())
            return true
            
            
        }
        
        return false
    }
    
    private func saveDate(date: String) {
        userDefaultsStorage?.setDateShowedSleepScreen(date: date)
    }
    
}
