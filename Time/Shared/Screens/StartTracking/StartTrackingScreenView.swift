//
//  StartTrackingScreenView.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 28.01.2022.
//

import SwiftUI

struct StartTrackingScreenView: View {
    var body: some View {
        ZStack {
            Image(Images.timeTrackerBGimg)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                TimeNavBarView(
                    leftTitle: Titles.trackYorTime,
                    onMenuClick: {}
                )
                Spacer()
                Text("Select category View")
                Spacer()
                
                VStack(spacing: 20) {
                    Text("01:15:59")
                        .font(.spartanTimeTitle)
                        .foregroundColor(Color.white)
                    TimeButtonView(text: "Stop") {
                        
                    }
                }

            }
            .fillMaxSize()
            
        }
        .navigationBarHidden(true)
         .onAppear(perform: {
                UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
            })
    }
}

struct StartTrackingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartTrackingScreenView()
    }
}
