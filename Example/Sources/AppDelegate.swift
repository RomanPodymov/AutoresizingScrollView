//
//  AppDelegate.swift
//  AutoresizingScrollViewExample
//
//  Created by Roman Podymov on 07/02/2023.
//  Copyright © 2023 AutoresizingScrollViewExample. All rights reserved.
//

#if canImport(UIKit)
import UIKit

typealias ViewController = UIViewController
typealias StackView = UIStackView
typealias Button = UIButton
typealias Color = UIColor

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

typealias ViewController = NSViewController
typealias StackView = NSStackView
typealias Button = NSButton
typealias Color = NSColor

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        window = NSWindow(contentViewController: FirstController())
        window.makeKeyAndOrderFront(nil)
    }
}
#endif
