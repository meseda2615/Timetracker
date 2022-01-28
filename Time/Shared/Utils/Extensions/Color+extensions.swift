//
//  Color+extensions.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 14.01.2022.
//



import SwiftUI

extension Color {
    public static var Tgray: Color {
        return Color(UIColor(named: "gray") ?? .tintColor)
    }
    
    public static var TlightGray: Color {
        return Color(UIColor(named: "light_gray") ?? .tintColor)
    }
    
    public static var Tyellow: Color {
        return Color(UIColor(named: "yellow") ?? .tintColor)
    }
    
    public static var Tgreen: Color {
        return Color(UIColor(named: "green") ?? .tintColor)
    }
    
    public static var Tpurple: Color {
        return Color(UIColor(named: "purple") ?? .tintColor)
    }
    
    public static var Tblack: Color {
        return Color(UIColor(named: "black") ?? .tintColor)
    }
}
