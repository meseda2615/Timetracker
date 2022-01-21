//
//  View+extensions.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 20.01.2022.
//


import SwiftUI


extension View {
    func fillMaxWidth() -> some View {
        frame(maxWidth: .infinity)
    }
    
    func fillMaxHeight() -> some View {
        frame(maxHeight: .infinity)
    }
    
    func fillMaxSize() -> some View {
        frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    
    func screenHeight(_ factor: CGFloat = 1.0) -> some View {
        frame(height: UIScreen.main.bounds.height * factor)
    }
    
    func screenWidth(_ factor: CGFloat = 1.0) -> some View {
        frame(width: UIScreen.main.bounds.width * factor)
    }
    func screenWidthMinus(_ factor: CGFloat = 0.0) -> some View {
        frame(width: UIScreen.main.bounds.width - factor)
    }
    func screenHeightMinus(_ factor: CGFloat = 0.0) -> some View {
        frame(height: UIScreen.main.bounds.height - factor)
    }
}


extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}

extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        return overlay(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(content, lineWidth: width))
    }
    
    public func addBackGround<S>(_ content: S, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        return self.background(content)
                    .cornerRadius(cornerRadius)
    }
}

// MARK: - Conditional
extension View {
    // If condition is met, apply modifier, otherwise, leave the view untouched
    public func conditionalModifier<T>(_ condition: Bool, _ modifier: T) -> some View where T: ViewModifier {
        Group {
            if condition {
                self.modifier(modifier)
            } else {
                self
            }
        }
    }

    // Apply trueModifier if condition is met, or falseModifier if not.
    public func conditionalModifier<M1, M2>(_ condition: Bool, _ trueModifier: M1, _ falseModifier: M2) -> some View where M1: ViewModifier, M2: ViewModifier {
        Group {
            if condition {
                self.modifier(trueModifier)
            } else {
                self.modifier(falseModifier)
            }
        }
    }
}

// MARK: - Image
extension Image {
    init(_ name: String, defaultImage: String) {
        if let img = UIImage(named: name) {
            self.init(uiImage: img)
        } else {
            self.init(defaultImage)
        }
    }
    
    init(_ name: String, defaultSystemImage: String) {
        if let img = UIImage(named: name) {
            self.init(uiImage: img)
        } else {
            self.init(systemName: defaultSystemImage)
        }
    }
}

// MARK: - Bounds


extension View {
    public func saveBounds(viewId: Int, coordinateSpace: CoordinateSpace = .global) -> some View {
        background(GeometryReader { proxy in
            Color.clear.preference(key: SaveBoundsPrefKey.self, value: [SaveBoundsPrefData(viewId: viewId, bounds: proxy.frame(in: coordinateSpace))])
        })
    }
    
    public func retrieveBounds(viewId: Int, _ rect: Binding<CGRect>) -> some View {
        onPreferenceChange(SaveBoundsPrefKey.self) { preferences in
            DispatchQueue.main.async {
                // The async is used to prevent a possible blocking loop,
                // due to the child and the ancestor modifying each other.
                let p = preferences.first(where: { $0.viewId == viewId })
                rect.wrappedValue = p?.bounds ?? .zero
            }
        }
    }
}

struct SaveBoundsPrefData: Equatable {
    let viewId: Int
    let bounds: CGRect
}

struct SaveBoundsPrefKey: PreferenceKey {
    static var defaultValue: [SaveBoundsPrefData] = []
    
    static func reduce(value: inout [SaveBoundsPrefData], nextValue: () -> [SaveBoundsPrefData]) {
        value.append(contentsOf: nextValue())
    }
    
    typealias Value = [SaveBoundsPrefData]
}


extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}


extension RandomAccessCollection {
    func indexed() -> Array<(offset: Int, element: Element)> {
        Array(enumerated())
    }
}
