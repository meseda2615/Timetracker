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
    
    
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var  viewModel: CategoryDetailsViewModel

    
    @State var data: [(String, [String])] = [
        ("One", Ranges.hours.map { "\($0)" }),
        ("Two", Ranges.minutes.map { "\($0)" })
    ]
    
    
    var body: some View {
        
        ZStack(alignment: .top) {
            VStack(spacing:20) {
                
                Image(Images.categoryDetailsImg)
                    .resizable()
                    .screenHeight(viewModel.showDatePicker ? 0.4 : 0.7)
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
                        if (viewModel.showDatePicker) {
                            
                            GeometryReader { g in
                                MultiPickerView(data: data, selection: $viewModel.pickerSelection)
                                    
                                Text("h")
                                    .position(x: g.size.width * 0.38, y: g.size.height * 0.5)
                                Text("min")
                                    .position(x: g.size.width * 0.9, y: g.size.height * 0.5)
                            }.screenHeight(0.3)
                            
                        }
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
            
            
        }.onReceive(viewModel.savedSeconds) { saved in
            print("Need dismiss screen")
            if saved {
                dismiss()
                
            }
            
        }
        .onAppear {
            UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
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
        CategoryDetailsView(viewModel: CategoryDetailsViewModel(category: .sleep, userDefaultsStorage: ServiceLocator.shared.getService()))
    }
}
