//
//  MainView.swift
//  TimeTracker (iOS)
//
//  Created by Павел Мишагин on 13.01.2022.
//

import SwiftUI

struct MainView: View {

    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        
        OnBoardingView()
            .environmentObject(viewModel)
            .hidden(viewModel.hasOnboardingSeen)
        
        CategoryView().hidden(!viewModel.hasOnboardingSeen)
    }
}


