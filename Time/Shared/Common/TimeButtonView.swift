//
//  TimeButton.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 21.01.2022.
//

import SwiftUI





struct TimeButtonView: View {
    
    var text: String
    var onClick: () -> Void
    
    
    
    var body: some View {
        Button(action: onClick) {
            Text(text)
                .fontWeight(.medium)
                .padding()
                .fillMaxWidth()
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(8)
                
        }
        .screenWidthMinus(32)
        
    }
}

struct TimeButton_Previews: PreviewProvider {
    static var previews: some View {
        TimeButtonView(text: "Start", onClick: { })
    }
}
