//
//  TimeNavBarView.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 21.01.2022.
//

import SwiftUI

struct TimeNavBarView: View {
    
    var leftTitle: String
    var onMenuClick: (() -> Void)?
    
    var body: some View {
        HStack {
            Text(leftTitle)
                .font(.spartanMedium)
                .foregroundColor(.white)
            Spacer()
            
            if (onMenuClick != nil) {
                Button(action: {onMenuClick?()}) {
                    Image(Images.menuIcon)
                        .resizable()
                        .renderingMode(.original)
                        .size(18)
                }
            }
            
            
        }
        .padding(.horizontal,16)
        .padding(.top,10)
    }
}

struct TimeNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        TimeNavBarView(leftTitle: "Sleep", onMenuClick: {}).background(Color.Tblack)
    }
}
