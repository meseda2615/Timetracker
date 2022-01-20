//
//  View+extensions.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 20.01.2022.
//


import SwiftUI


extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
