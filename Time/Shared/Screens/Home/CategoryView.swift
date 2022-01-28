//
//  HomeView.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 20.01.2022.
//

import SwiftUI

struct CategoryView: View {
    
    // we can use here appstorage
    // and when we update stirage frim user defaults we can redraw here
    
    
    private let twoColumns = [GridItem(spacing: 12), GridItem(spacing: 12)]
    
    @ObservedObject  var viewModel: ViewModel
    
    @State private var showNotReadyAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.TlightGray.ignoresSafeArea()
                
                VStack(spacing: 12) {
                    
                    CategoryNavBar(
                        date: viewModel.state.model.date,
                        result: viewModel.state.model.totalResult,
                        openStatsTap: {showNotReadyAlert = true},
                        clearDayTap: {viewModel.setInputAction(.clearDay)},
                        clearSelectedCategory: {viewModel.setInputAction(.clearSeelctedCategory)}
                    )
                    
                    LazyVGrid(columns: twoColumns,spacing: 20) {
                        
                        ForEach(viewModel.state.model.data) { item in
                            
                            CategoryItemView(
                                item: item,
                                onTapItem: {
                                viewModel.setInputAction(.onSelectItem(item: item))
                            },
                                onLongTapItem: {
                                    viewModel.setInputAction(.onLongSelectItem(item: item))
                                })
                            
                        }
                        
                    }
                    
                    TimeButtonView(text: "Start to track") {
                        viewModel.setInputAction(.startToTrack)
                    }
                    
                    // nav link to push screens
                    
                    NavigationLink(isActive: $viewModel.isOpenStartToTrakcScreen, destination: {StartTrackingScreenView()}, label: {EmptyView()})
                }
                .fullScreenCover(item: $viewModel.selectedItem, onDismiss: {
                    UIApplication.shared.setStatusBarStyle(.darkContent, animated: true)
                    viewModel.setInputAction(.onAppear)
                }) { item in
                    CategoryDetailsView(viewModel: CategoryDetailsViewModel(category: item.category))
                }
                .alert(isPresented: $showNotReadyAlert) {
                    Alert(title: Text("Not Ready"),
                          message: Text("Please buy app to see"))
                }
                
                .fillMaxSize()
                .padding(.horizontal,16)
            }.navigationBarHidden(true)
                .onAppear {
                    UIApplication.shared.setStatusBarStyle(.darkContent, animated: true)
                    viewModel.setInputAction(.onAppear)
                }
        }
    }
}


private struct CategoryNavBar: View {
    
    var date: Date
    var result: String
    
    var openStatsTap: () -> Void
    var clearDayTap: () -> Void
    var clearSelectedCategory: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading,spacing: 2) {
                Text(date.toString(format: "MMMM dd, yyyy"))
                    .font(.spartanTitle)
                Text("\(result) / 24 hours")
                    .font(.system(size: 10))
            }
            Spacer()

            Menu {
                Button(action: clearDayTap) {
                    Text("Clear day")
                    Image(systemName: "clear")
                }
                Button(action: clearSelectedCategory) {
                    Text("Clear selected category")
                    Image(systemName: "clear.fill")
                }
                Button(action: openStatsTap) {
                    Text("Open Statistics")
                    Image(systemName: "globe")
                }
            } label: {
                Image(Images.menuIcon)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.black)
                    .size(18)
            }
            
            
        }.fillMaxWidth()
    }
}


// MARK: - Category Item
private struct CategoryItemView: View {
    
    var item: TimeCategoryModel
    var onTapItem : () -> Void
    var onLongTapItem : () -> Void
    
    var body: some View {
        GeometryReader { r in
            VStack(alignment: .leading) {
                Image(item.imageString)
                    .resizable()
                
                
                VStack(alignment: .leading,spacing: 5) {
                    Text("\(item.category.rawValue.capitalized)")
                        .font(.spartanMedium)
                    
                    Text("\(item.resultTime)")
                        .font(.system(size: 10))
                }.padding(.leading,10)
                    .padding(.vertical,12)
                
            }
        }
        
        .foregroundColor(item.isSelected ? Color.white : Color.black)
        .screenHeight(0.24)
        .screenWidth(0.44)
        .background(item.isSelected ? Color.black : Color.white)
        .cornerRadius(8)
        .onTapGesture(perform: onTapItem)
        .onLongPressGesture(perform: onLongTapItem)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(viewModel: CategoryView.ViewModel())
    }
}
