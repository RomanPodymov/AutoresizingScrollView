//
//  Extensions.swift
//  AutoresizingScrollViewExample
//
//  Created by Roman Podymov on 09/02/2023.
//  Copyright © 2023 AutoresizingScrollViewExample. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension UIButton {
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
import AppKit

extension NSView {
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
            container[AttributeScopes.UIKitAttributes.ForegroundColorAttribute.self] = newValue
            #endif
            titleWithColor.setAttributes(container)
            attributedTitle = NSAttributedString(titleWithColor)
        }
    }
}
