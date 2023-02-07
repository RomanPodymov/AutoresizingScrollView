//
//  AppDelegate.swift
//  AutoresizingScrollViewExample
//
//  Created by Roman Podymov on 07/02/2023.
//  Copyright © 2023 AutoresizingScrollViewExample. All rights reserved.
//

import UIKit

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
