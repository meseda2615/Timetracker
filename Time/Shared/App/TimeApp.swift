//
//  TimeApp.swift
//  Shared
//
//  Created by Павел Мишагин on 14.01.2022.
//

import SwiftUI

@main
struct TimeApp: App {
    
    
    init() {
        initServiceLocator()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel(userDefaultsStorage: ServiceLocator.shared.getService()))
        }
    }
    
    
    private func initServiceLocator() {
        ServiceLocator.shared.addService(service: UserStorageService())
    }
}
