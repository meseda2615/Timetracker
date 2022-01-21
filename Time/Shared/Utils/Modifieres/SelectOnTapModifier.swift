//
//  SelectOnTap.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 21.01.2022.
//

import SwiftUI


extension View {
    func selectOnTap(_ color: Color) -> some View { modifier(SelectOnTapModifier(color: color)) }
}

struct SelectOnTapModifier: ViewModifier {
    let color: Color
    @State private var tapped: Bool = false
    
    func body(content: Content) -> some View {
        
        return content
            .padding(20)
            
            .foregroundColor(.white)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(tapped ? color : Color.clear, lineWidth: 3.0))
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.tapped.toggle()
                }
            }
    }
}
