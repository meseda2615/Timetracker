//
//  MainView.swift
//  TimeTracker (iOS)
//
//  Created by Павел Мишагин on 13.01.2022.
//

import SwiftUI

struct MainView: View {
    
    private let userDefaultsStorage: UserStorageService? = ServiceLocator.shared.getService()

    
    @ObservedObject var viewModel: ViewModel
    @State var isNeedToShowSleep: Bool = false
    // chekc user defaults and render this view when we update it
    @AppStorage(UserStorageService.Keys.OnBoarding.seenKey) var hasOnboardingSeen = false
    
    var body: some View {
        
        if (hasOnboardingSeen == false) {
            OnBoardingView()
            // i can pass same viewmodle to several view deep
                .environmentObject(viewModel)
                
        } else {
            
            CategoryView()
                .onAppear {
                    if (viewModel.checkIfNeedShowSleepScreenToday()) {
                        isNeedToShowSleep = true
                    }
                }
                .fullScreenCover(isPresented: $isNeedToShowSleep, onDismiss: {
                    UIApplication.shared.setStatusBarStyle(.darkContent, animated: true)
                }) {
                    CategoryDetailsView(viewModel:
                                            CategoryDetailsViewModel(
                                                category: .sleep,
                                                userDefaultsStorage: userDefaultsStorage))
                }
            
        }
        
        
        
    }
}


