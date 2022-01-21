//
//  CategoryDetailsView.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 21.01.2022.
//

import SwiftUI

// Need to make category Details View
// Need to figure out logic showing sleep categoryDetails
// need to save last date showing sleep screen
// and if we have the same day and month and year we will not showing this screen
// but if we have another date we have to show sleep screen first

// MARK: - Model

enum TimeFilter {
    case sixHours
    case sevenHours
    case eightHours
    
    
    case thirtyMin
    case oneHour
    case twoHours

    
    case other
    
}



// MARK: - View

struct CategoryDetailsView: View {
    
    
//    private let filters = [
//
//    ]
    
    var body: some View {
        VStack {
            Image(Images.categoryDetailsImg)
                .resizable()
                .renderingMode(.original)
                .fillMaxWidth()
                .ignoresSafeArea()
                .screenHeight(0.6)
            
                
            Text(Titles.howLongdidYouSleep)
                .font(.spartanTitle)
                .padding(.top,33)
                
            
//            HStack {
//                ForEach(
//            }
            
            // Need to use here commont button
            Button(action: {}) {
                Text("Some Button")
            }
            Spacer()
        }
        .fillMaxSize()
        .background(Color.white)
    }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsView()
    }
}
