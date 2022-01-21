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





// MARK: - View

struct CategoryDetailsView: View {
    
    
    @ObservedObject var viewModel: CategoryDetailsViewModel
    
    
    var body: some View {
        
        ZStack(alignment: .top) {
            VStack(spacing:20) {
                
                Image(Images.categoryDetailsImg)
                    .resizable()
                    .screenHeight(0.7)
                    .edgesIgnoringSafeArea(.top)
                
                
                VStack {
                    
                    
                    VStack(spacing: 22) {
                        Text(viewModel.category == .sleep ? Titles.howLongdidYouSleep : Titles.whatDoYouWantToAdd)
                            .font(.spartanTitle)
                        
                        
                        // need to add selectable item
                        TimeFiltersView(
                            filters: viewModel.filters,
                            onTappitemIndex: viewModel.setInputAction
                        )
                    }
                    
                    
                    Spacer()
                    
                    
                    // Need to use here commont button
                    TimeButtonView(
                        text: viewModel.category == .sleep ? Actions.saveAndStart : Actions.save, onClick: {viewModel.setInputAction(.onClickSave)})
                        .edgesIgnoringSafeArea(.bottom)
                        .padding(.bottom,10)
                    
                    
                }
                
                .fillMaxWidth()
                
                
                
            }.fillMaxSize()
                .edgesIgnoringSafeArea(.top)
                .background(Color.white)
            
            TimeNavBarView(leftTitle: viewModel.category.rawValue.capitalized)
            
            
        }.onAppear {
            // if need to change status bar by hands
            //            UIApplication.shared.statusBarStyle = .darkContent
        }
        
        
    }
}


// MARK: - FiltersView
struct TimeFiltersView: View {
    
    
    var filters: [TimeFilterModel]
    var onTappitemIndex: (CardDetailsViewAction) -> Void
    
    var body: some View {
        
        HStack(spacing:8) {
            
            ForEach(0..<filters.count, id: \.self) { i in
                
                TimeFilterItem( filterModel: filters[i], onTapitem: {onTappitemIndex(.selectIndex(idx: i))})
                
            }
        }
        
    }
}

// MARK: - Filter Item
struct TimeFilterItem: View {
    
    var filterModel: TimeFilterModel
    
    var onTapitem: () -> Void
    
    var body: some View {
        Text(filterModel.value.rawValue)
            .font(.system(size: 14))
            .fontWeight(.regular)
            .frame(width: 70, height: 40, alignment: .center)
            .addBackGround(filterModel.isSelected ? .Tblack : filterModel.color, cornerRadius: 4)
            .foregroundColor(filterModel.isSelected ? .white : .Tblack)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3),onTapitem)
            }
    }
}




struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsView(viewModel: CategoryDetailsViewModel(category: .sleep))
    }
}
