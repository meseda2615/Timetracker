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
            MainView(viewModel: MainView.ViewModel(userDefaultsStorage: ServiceLocator.shared.getService()))
        }
    }
    
    // Need to init all services and get it in any place from code
    private func initServiceLocator() {
        ServiceLocator.shared.addService(service: UserStorageService())
    }
}
