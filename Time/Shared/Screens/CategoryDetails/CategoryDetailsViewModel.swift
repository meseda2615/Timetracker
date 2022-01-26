//
//  CategoryDetailsViewModel.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 21.01.2022.
//

import Foundation
import SwiftUI
import Combine

final class CategoryDetailsViewModel:  ObservableObject {
    
    // reRender View when set new value  wich contains this ViewModel like ObservedObject
    
    let category: TimeCategory
    private let userDefaultsStorage: UserStorageService?

    // Outputs
    @Published var filters: [TimeFilterModel] = []
    @Published var showDatePicker: Bool = false
    
    var selectedSeconds: Double = 0
    
    @Published var pickerSelection: [String] = [1, 15].map { "\($0)" }
    
    var savedSeconds = PassthroughSubject<Bool,Never>()
    
   

    
    init(
        category: TimeCategory,
        userDefaultsStorage: UserStorageService?
    ) {
        self.userDefaultsStorage = userDefaultsStorage
            self.category = category
        
            
            filters = category == .sleep ? [
                .init(value: .sixHours,
                      color: .Tyellow,
                      isSelected: true),
                .init(value: .sevenHours, color: .Tpurple),
                .init(value: .eightHours, color: .Tgreen),
                .init(value: .other, color: .Tyellow)
            ] :
                
                [
                    .init(value: .thirtyMin,
                          color: .Tyellow,
                          isSelected: true),
                    .init(value: .oneHour, color: .Tpurple),
                    .init(value: .twoHours, color: .Tgreen),
                    .init(value: .other, color: .Tyellow)
                ]
        // need to set first value by default
        selectFilter(0)
    }
    
    
}

// MARK: - Input
extension CategoryDetailsViewModel {
    
    
    func setInputAction(_ action: CardDetailsViewAction)  {
        
        switch (action) {
            
        case .onClickSave: saveDate()
        case .selectIndex(let idx): selectFilter(idx)
            
        }
        
    }
    
    private func saveDate() {
        // need to save here horus and minutes for this day

        
        if showDatePicker {
            // need to get selection picker value
            let hour = Int(pickerSelection.first ?? "0") ?? 0
            let min = Int(pickerSelection.last ?? "0") ?? 0
            
            selectedSeconds = hour.hourseToSeconds() + min.minutesToSeconds()
        }
        
        
        
        saveSpendSecondsByCategory(seconds: selectedSeconds)
        
    }
    
    private func selectFilter(_ idx: Int) {
        // clear all filter
        
        let selectedFilter = filters[idx]
        filters.indexed().forEach { i, _ in
            filters[i].isSelected = false
        }
        filters[idx].isSelected = true
        
        
        withAnimation(.easeOut(duration: 0.3)) {
            showDatePicker = selectedFilter.value == .other
            
        }
        
        // go from this func if we select other
        guard selectedFilter.value != .other else {
            selectedSeconds = 0
            return
            
        }
        
        // need to get only Ints from this string
        let value =  Int.parse(from: selectedFilter.value.rawValue) ?? 0
        
        if selectedFilter.value == .thirtyMin {
            // no need to make convertions here
            selectedSeconds  = value.minutesToSeconds()
        } else {
            selectedSeconds  = value.hourseToSeconds()
        }
        
    }
    
    
    // will save value by seconds or minutes
    private func saveSpendSecondsByCategory(seconds: Double) {
        print("Save Seconds", selectedSeconds)
        print("Save Category", category)
        userDefaultsStorage?.updateCategoryModel(category: category, seconds: seconds)
        savedSeconds.send(true)
    }
}
