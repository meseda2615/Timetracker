//
//  OnBoardingView.swift
//  TimeTracker
//
//  Created by Павел Мишагин on 14.01.2022.
//

import SwiftUI

// Model

struct TimeOnboardingModel {
    
    var title: String = ""
    var description: String = ""
    var isStartButtonItem = false
}

extension TimeOnboardingModel: Hashable {}

// View

struct OnBoardingView: View {
    
    private let onboardingImages = [
        Images.onboardingTrackTime,
        Images.onboardingAnalyseTime,
        Images.onboardingLiveTime
    ]
    
    private let onboardingModels = [
        TimeOnboardingModel(title: Titles.trackYourTime, description: Messages.trackYourTime),
        TimeOnboardingModel(title: Titles.analyseYourTime, description: Messages.analyseYourTime),
        TimeOnboardingModel(title: Titles.liveYourTime, description: Messages.liveYourTime, isStartButtonItem: true)
    ]
    
    @State private var modelIndex = 0
    
    @State private var appearIndex = 0

    
    var body: some View {
        
        VStack {
            
            TabView {
                
                ForEach(0..<onboardingImages.count) { idx in

                    Image(onboardingImages[idx])
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width)
                        .ignoresSafeArea()
                    // here logic to update description when swiping image ends
                        .onDisappear {

                            if (appearIndex != idx) {
                                // We get new image
                                modelIndex = appearIndex
                                
                            }
                            
                        }
                        .onAppear {
                            self.appearIndex = idx
                        }
            
                }
         
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle())
            
            
            OnboardingDescriptionView(model: onboardingModels[modelIndex])
            
            
            
        }.ignoresSafeArea()
    }
}

// Onboarding Description View
// MARK: - OnBoardingDescription VIew

private struct OnboardingDescriptionView: View {
    
    var model: TimeOnboardingModel
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 8)  {
            Text(model.title)
                .font(.spartanTitle)
                .padding(.top, 36)
            Text(model.description)
                .foregroundColor(Color.Tgray)
                .font(.spartanBody)
                .padding(.bottom,model.isStartButtonItem ? 53 : 100)
            
            if (model.isStartButtonItem) {
             
                
                Button(action: {print("Continue Onboarding")}) {
                    Text(Actions.start)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(8)
                        
                }
                .frame(width: UIScreen.main.bounds.width - 32)
                .padding(.bottom,40)
            }
           
                
                
        }
        .padding(.horizontal, 16)
        .multilineTextAlignment(.center)
        .frame(height:UIScreen.main.bounds.height * 0.30)
        .animation(.linear(duration: 0.2), value: model)
    
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
