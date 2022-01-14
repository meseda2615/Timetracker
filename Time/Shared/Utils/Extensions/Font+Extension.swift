//
//  Font+Extension.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 14.01.2022.
//

import SwiftUI

extension Font {
    public static var spartanTitle: Font {
        return Font.custom("Spartan", size: 18).weight(.medium)
    }
    
    public static var spartanBody: Font {
        return Font.custom("Spartan", size: 14).weight(.regular)
    }
}
