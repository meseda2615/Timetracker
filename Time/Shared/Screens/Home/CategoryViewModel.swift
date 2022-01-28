//
//  CategoryViewModel.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 21.01.2022.
//

import Foundation

extension CategoryView {
    final class ViewModel:  ObservableObject {
        
        // reRender View when set new value  wich contains this ViewModel like ObservedObject
        
        
        private let userDefaultsStorage: UserStorageService?
        
        init(userDefaultsStorage: UserStorageService? = ServiceLocator.shared.getService()) {
            self.userDefaultsStorage = userDefaultsStorage
            
        }
        
        @Published var state = CategoryState()
        @Published var selectedItem: TimeCategoryModel? = nil
        @Published var isOpenStartToTrakcScreen = false
        let categoryCount = 6
        
        
    }
}


// MARK: - Input Actions

extension CategoryView.ViewModel {
    func setInputAction(_ input: CategoryAction) {
        switch input {
        case .onAppear: getCategoryModel()
        case .onSelectItem(let item): updateSelectedAndShowDetails(item: item)
        case .onLongSelectItem(let item): onLongSelected(item: item)
        case .startToTrack: isOpenStartToTrakcScreen = true
        case .clearDay: clearDayModel()
        case .clearSeelctedCategory: clearSelectedCategory()
        }
    }
}


// MARK: - Get fro mStorage
extension CategoryView.ViewModel {
    
    private func getCategoryModel() {
        print("Get Model")
        var newState = CategoryState()
        if let storageModel = userDefaultsStorage?.getTodayCategoryModel() {

            // need iteratiing and find category and write results from storage
            print("Storage Model", storageModel)
            
            var result: Double  = 0
           
            for item in storageModel.data {
                
                if let firstindex = state.model.data.firstIndex(where: {$0.category.rawValue == item.key}) {
                    newState.model.data[firstindex].resultTime = item.value.asString(style: .full)
                    result += item.value
                }
                
            }
            
            newState.model.totalResult = result.asString(style: .full)
            
            if let firstindex = newState.model.data.firstIndex {$0.category.rawValue == storageModel.selectedCategory} {
                newState.model.data[firstindex].isSelected = true
            }
            
        }
        
        state = newState
        
    }
    
    private func updateSelectedAndShowDetails(item: TimeCategoryModel) {
        
        print("Update selected", item)
        
        state.model.data.indexed().forEach { i,v in
            state.model.data[i].isSelected = false
        }
        if let index = state.model.data.firstIndex(where: {$0.category == item.category}) {
            state.model.data[index].isSelected = true
        }
        
        
        
        userDefaultsStorage?.updateCategoryModel(selectedCategory: item.category.rawValue)
    }
    
    private func onLongSelected(item: TimeCategoryModel) {
        // and need navigate details
        selectedItem = item
    }
    
    private func clearDayModel() {
        userDefaultsStorage?.clearModel()
        state = CategoryState()
    }
    
    private func clearSelectedCategory() {
        
        if let selectedItem = state.model.data.first(where: {$0.isSelected}) {
            
            userDefaultsStorage?.clearSelectedCategory(category: selectedItem.category)
            getCategoryModel()
        }
        
    }
}


