//
//  Font+Extension.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 14.01.2022.
//

import SwiftUI

extension Font {
    public static var spartanTitle: Font {
        return Font.custom("Spartan-Bold", size: 18)
    }
    
    public static var spartanTimeTitle: Font {
        return Font.custom("Spartan-Bold", size: 26)
    }
    
    public static var spartanBody: Font {
        return Font.custom("Spartan-Regular", size: 14)
    }
    
    public static var spartanMedium: Font {
        return Font.custom("Spartan-Medium", size: 14)
    }
    
    public static var spartanSemiBold: Font {
        return Font.custom("Spartan-SemiBold", size: 14)
    }
}
