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
        
        if (viewModel.hasOnboardingSeen == false) {
            OnBoardingView()
            // i can pass same viewmodle to several view deep
                .environmentObject(viewModel)
                
        } else {
            CategoryDetailsView(viewModel: CategoryDetailsViewModel(category: .sleep))
        }
        
        
        
    }
}


