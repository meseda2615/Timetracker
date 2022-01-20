//
//  MainView.swift
//  TimeTracker (iOS)
//
//  Created by Павел Мишагин on 13.01.2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel : MainViewModel
    
    var body: some View {
        OnBoardingView().hidden(viewModel.hasOnboardingSeen)
        
        HomeView().hidden(!viewModel.hasOnboardingSeen)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
