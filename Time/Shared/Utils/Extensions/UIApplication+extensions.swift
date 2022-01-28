//
//  UIApplication+extensions.swift
//  Time (iOS)
//
//  Created by Павел Мишагин on 21.01.2022.
//

import SwiftUI


extension UIApplication {
      // 1. Function that we can call via `UIApplication.setStatusBarStyle(...)`
    class func setStatusBarStyle(_ style: UIStatusBarStyle) {
          // Get the root view controller, which we've set to be `ContentHostingController`
        if let vc = UIApplication.getKeyWindow()?.rootViewController as? ContentHostingController {
                 // Call the method we've defined
            vc.changeStatusBarStyle(style)
        }
    }
      // 2. Helper function to get the key window
    private class func getKeyWindow() -> UIWindow? {
        return UIApplication.shared.windows.first{ $0.isKeyWindow }
    }
}

class ContentHostingController: UIHostingController<MainView> {
      // 1. We change this variable
    private var currentStatusBarStyle: UIStatusBarStyle = .default
      // 2. To change this property of `UIHostingController`
    override var preferredStatusBarStyle: UIStatusBarStyle {
        currentStatusBarStyle
    }
      // 3. A function we can call to change the style programmatically
    func changeStatusBarStyle(_ style: UIStatusBarStyle) {
        self.currentStatusBarStyle = style
          // 4. Required for view to update
        self.setNeedsStatusBarAppearanceUpdate()
    }
}
