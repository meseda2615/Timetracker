//
//  ExtensionTestView.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 21.01.2022.
//

import SwiftUI

struct ExtensionTestView: View {
    var body: some View {
        ContentView()
    }
}

struct ExtensionTestView_Previews: PreviewProvider {
    static var previews: some View {
        ExtensionTestView()
    }
}


struct ContentView: View {
    @State private var littleRect: CGRect = .zero
    @State private var bigRect: CGRect = .zero
    
    var body: some View {
           Image(systemName: "doc.on.doc")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.red, .green, .blue)
        }
}


