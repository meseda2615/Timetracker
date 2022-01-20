//
//  MainView.swift
//  TimeTracker (iOS)
//
//  Created by Павел Мишагин on 13.01.2022.
//

import SwiftUI

struct MainView: View {

    var viewModel =  MainViewModel(
        userDefaultsStorage: ServiceLocator.shared.getService()
    )
    
    var body: some View {
        OnBoardingView()
            .environmentObject(viewModel)
            .hidden(viewModel.hasOnboardingSeen)
        
        HomeView().hidden(!viewModel.hasOnboardingSeen)
    }
}


