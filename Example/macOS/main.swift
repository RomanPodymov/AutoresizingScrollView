//
//  main.swift
//  AutoresizingScrollViewExample
//
//  Created by Roman Podymov on 08/02/2023.
//  Copyright © 2023 AutoresizingScrollViewExample. All rights reserved.
//

#if os(macOS)
import AppKit

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
#endif
