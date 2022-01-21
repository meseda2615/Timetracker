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
        VStack {
            Text("Little = \(littleRect.debugDescription)")
            Text("Big = \(bigRect.debugDescription)")
            HStack {
                LittleView()
                BigView()
            }
            .coordinateSpace(name: "mySpace")
            .retrieveBounds(viewId: 1, $littleRect)
            .retrieveBounds(viewId: 2, $bigRect)
        }
    }
}

struct LittleView: View {
    var body: some View {
        Text("Little Text")
            .font(.caption)
            .padding(20)
            .saveBounds(viewId: 1, coordinateSpace:.named("mySpace"))
    }
}

struct BigView: View {
    var body: some View {
        Text("Big Text").font(.largeTitle).padding(20).saveBounds(viewId: 2, coordinateSpace: .named("mySpace"))
    }
}
