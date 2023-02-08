//
//  AppDelegate.swift
//  AutoresizingScrollViewExample
//
//  Created by Roman Podymov on 07/02/2023.
//  Copyright © 2023 AutoresizingScrollViewExample. All rights reserved.
//

import AutoresizingScrollView
#if canImport(UIKit)
import UIKit

typealias Color = UIColor
typealias ViewController = UIViewController
typealias StackView = UIStackView
typealias Button = UIButton

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = FirstController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}
#elseif canImport(AppKit)
import AppKit

typealias Color = NSColor
typealias ViewController = NSViewController
typealias StackView = NSStackView
typealias Button = NSButton

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        window = NSWindow(contentViewController: FirstController())
        window.makeKeyAndOrderFront(nil)
    }
}
#endif

#if canImport(UIKit)
extension Button {
    var title: String {
        get {
            title(for: .normal) ?? ""
        }

        set {
            setTitle(newValue, for: .normal)
        }
    }
    
    var attributedTitle: NSAttributedString? {
        get {
            attributedTitle(for: .normal)
        }
        
        set {
            setAttributedTitle(newValue, for: .normal)
        }
    }
}
#elseif canImport(AppKit)
extension View {
    var backgroundColor: NSColor? {
        get {
            guard let color = layer?.backgroundColor else { return nil }
            return NSColor(cgColor: color)
        }
        set {
            wantsLayer = true
            layer?.backgroundColor = newValue?.cgColor
        }
    }
}
#endif

extension Button {
    var titleColor: Color? {
        get {
            nil
        }
        
        set {
            var titleWithColor = AttributedString(title)
            var container = AttributeContainer()
            #if canImport(AppKit)
            container[AttributeScopes.AppKitAttributes.ForegroundColorAttribute.self] = newValue
            #else
            #endif
            titleWithColor.setAttributes(container)
            attributedTitle = NSAttributedString(titleWithColor)
        }
    }
}
