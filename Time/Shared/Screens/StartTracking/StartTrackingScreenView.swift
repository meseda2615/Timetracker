//
//  StartTrackingScreenView.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 28.01.2022.
//

import SwiftUI

struct StartTrackingScreenView: View {
    @State var currentDate: String = "0"
    @State private var onAppearTime = Date()
    
    @State private var secondsBeetwen: Double = 0
    
    @State private var isShowedCategory = false
    @State private var selectedCategory: TimeCategory = .other
    
    @ObservedObject private var viewModel = ViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    
    private var categoryes: [TimeCategory] = [
        .sleep,
        .work,
        .education,
        .health,
        .family,
        .mix
    ]
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                
                
                // Menu List
                if (isShowedCategory) {
                    VStack {
                        
                        
                        Menu(Titles.selectTheCategory) {
                            
                            Picker(selection: $selectedCategory, label: Text("")) {
                                ForEach(0 ..< categoryes.count) { index in
                                    Text(categoryes[index].rawValue.capitalized)
                                        .tag(categoryes[index])

                                }
                            }
                        }
                        if selectedCategory != .other {
                            Text(selectedCategory.rawValue.capitalized )
                        }
                        
                    }.foregroundColor(Color.white)
                        .font(.spartanTitle)
                    
                    
                }
                
                Spacer()
                // Timer and button
                VStack(spacing: 20) {
                    Text(currentDate)
                        .font(.spartanTimeTitle)
                        .foregroundColor(Color.white)
                    
                    TimeButtonView(text: isShowedCategory ? Actions.save: Actions.stop) {
                        
                        timer.upstream.connect().cancel()
                        if (selectedCategory != .other) {
                            
                            viewModel.saveTimeToCategory(category: selectedCategory, seconds: secondsBeetwen)
                            
                            dismiss()
                        }
                        isShowedCategory = true
                    }
                }
                
            }
            .fillMaxSize()
            
        }
        .navigationBarHidden(true)
        .onAppear {
            
            UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
            onAppearTime = Date()
            
        }
        .onReceive(timer) { time in
            
            secondsBeetwen = Double(Date.secondsBetween(date1: onAppearTime, date2: time))
            
            currentDate = secondsBeetwen.asString(style: .positional)
        }
    }
}

struct StartTrackingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartTrackingScreenView()
    }
}
