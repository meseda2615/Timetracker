//
//  CategoryDetailsViewModel.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 21.01.2022.
//

import Foundation
import SwiftUI


final class CategoryDetailsViewModel:  ObservableObject {
    
    // reRender View when set new value  wich contains this ViewModel like ObservedObject
    
    let category: TimeCategory

    // Outputs
    @Published var filters: [TimeFilterModel] = []
    @Published var showDatePicker: Bool = false
    
    
    init(
        category: TimeCategory) {
            
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
    }
    
    
}

// MARK: - Input
extension CategoryDetailsViewModel {
    
    
    func setInputAction(_ action: CardDetailsViewAction) {
        
        switch (action) {
            
        case .onClickSave: saveDate()
        case .selectIndex(let idx): selectFilter(idx)
            
        }
        
    }
    
    private func saveDate() {
        // need to save here horus and minutes for this day
    }
    
    private func selectFilter(_ idx: Int) {
        // clear all filter
        filters.indexed().forEach { i, _ in
            filters[i].isSelected = false
        }
        filters[idx].isSelected = true
        
        
        withAnimation(.easeOut(duration: 0.3)) {
            showDatePicker = filters[idx].value == .other
        }
        
       
    }
}
