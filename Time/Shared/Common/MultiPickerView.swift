//
//  MultiPickerView.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 26.01.2022.
//

import SwiftUI


struct MultiPickerView: View  {
    
    typealias Label = String
    typealias Entry = String
    
    let data: [ (Label, [Entry]) ]
    @Binding var selection: [Entry]
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(0..<self.data.count) { column in
                    Picker(self.data[column].0, selection: self.$selection[column]) {
                        ForEach(0..<self.data[column].1.count) { row in
                            Text(verbatim: self.data[column].1[row])
                                .tag(self.data[column].1[row])
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: geometry.size.width / CGFloat(self.data.count), height: geometry.size.height)
                    .clipped()
                }
            }
        }
    }
}
//struct MultiPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        MultiPickerView(data: [["1","2"], ["3","4"]], selection: .constant([0,1]))
//    }
//}
