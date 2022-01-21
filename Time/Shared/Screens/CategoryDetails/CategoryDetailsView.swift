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

enum TimeFilter: String {
    case sixHours = "6 hours"
    case sevenHours = "7 hours"
    case eightHours = "8 hours"
    
    
    case thirtyMin = "30 min"
    case oneHour = "1 hour"
    case twoHours = "2 hours"
    
    
    case other = "Other"
    
}



// MARK: - View

struct CategoryDetailsView: View {
    
    
    var category: TimeCategory
    
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
            
            // need to make bottom part constant height and resize image
            Text(category == .sleep ? Titles.howLongdidYouSleep : Titles.whatDoYouWantToAdd)
                .font(.spartanTitle)
                .padding(.top,33)
            
            
            TimeFiltersView(category: category)
            
            // Need to use here commont button
            TimeButtonView(text: category == .sleep ? Actions.saveAndStart : Actions.save, onClick: {})
            .padding(.bottom,40)
            Spacer()
        }
        .fillMaxSize()
        .background(Color.white)
    }
}


// MARK: - FiltersView
struct TimeFiltersView: View {
    
    var category: TimeCategory
    
    var filters: [TimeFilter] {
        category == .sleep ? [
            .sixHours,
            .sevenHours,
            .eightHours,
            .other
        ] :
        
        [
            .thirtyMin,
            .oneHour,
            .twoHours,
            .other
        ]
    }
    
    
    var filterColors: [Color] = [
        .Tyellow,
        .Tpurple,
        .Tgreen,
        .Tyellow
    ]
    
    var body: some View {
        HStack {
            ForEach(0..<filters.count, id: \.self) { i in
                TimeFilterItem(
                    text: filters[i].rawValue,
                    color: filterColors[i])
            }
        }
    }
}

struct TimeFilterItem: View {
    
    var text: String
    var color: Color
    
    var body: some View {
        Text(text)
            .font(.system(size: 14))
            .fontWeight(.regular)
            .frame(width: 70, height: 40, alignment: .center)
            .addBackGround(color, cornerRadius: 4)
    }
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsView(category: .sleep)
    }
}
