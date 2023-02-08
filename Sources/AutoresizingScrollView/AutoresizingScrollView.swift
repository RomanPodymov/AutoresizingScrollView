//
//  AutoresizingScrollView.swift
//  AutoresizingScrollView
//
//  Created by Roman Podymov on 06/12/2022.
//  Copyright © 2022 AutoresizingScrollView. All rights reserved.
//

#if canImport(UIKit)
import UIKit
public typealias View = UIView
public typealias ScrollView = UIScrollView
#elseif canImport(AppKit)
import AppKit
public typealias View = NSView
public typealias ScrollView = NSScrollView
#endif

public class AutoresizingScrollView<RootView: View>: ScrollView {
    public weak var rootView: RootView?

    private func setup(rootView: RootView) {
        self.rootView?.removeFromSuperview()
        self.rootView = rootView
        rootView.translatesAutoresizingMaskIntoConstraints = false
        #if canImport(AppKit)
        self.documentView?.addSubview(rootView)
        #endif
        setupRootViewConstraints()
    }
    
    #if canImport(AppKit)
    public func set(rootView: RootView, clipView: NSClipView? = nil, documentView: NSView? = nil) {
        if let clipView {
            contentView = clipView
        } else {
            setupDefaultClipView()
        }
        if let documentView {
            self.documentView = documentView
        } else {
            setupDocumentView()
        }
        setup(rootView: rootView)
    }
    
    private func setupDefaultClipView() {
        let clipView = NSClipView()
        clipView.translatesAutoresizingMaskIntoConstraints = false
        contentView = clipView
        let leadingConstraint, trailingConstraint, topConstraint, bottomContrant: NSLayoutConstraint
        if #available(macOS 10.11, *) {
            leadingConstraint = clipView.leadingAnchor.constraint(equalTo: leadingAnchor)
            trailingConstraint = clipView.trailingAnchor.constraint(equalTo: trailingAnchor)
            topConstraint = clipView.topAnchor.constraint(equalTo: topAnchor)
            bottomContrant = clipView.bottomAnchor.constraint(equalTo: bottomAnchor)
        } else {
            leadingConstraint = NSLayoutConstraint(item: clipView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0)
            trailingConstraint = NSLayoutConstraint(item: clipView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0)
            topConstraint = NSLayoutConstraint(item: clipView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
            bottomContrant = NSLayoutConstraint(item: clipView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
        }
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomContrant])
    }
    
    private func setupDocumentView() {
        let documentView = NSView()
        documentView.translatesAutoresizingMaskIntoConstraints = false
        self.documentView = documentView
        let leadingConstraint, trailingConstraint, topConstraint: NSLayoutConstraint
        if #available(macOS 10.11, *) {
            leadingConstraint = contentView.leadingAnchor.constraint(equalTo: documentView.leadingAnchor)
            trailingConstraint = contentView.trailingAnchor.constraint(equalTo: documentView.trailingAnchor)
            topConstraint = contentView.topAnchor.constraint(equalTo: documentView.topAnchor)
        } else {
            leadingConstraint = NSLayoutConstraint(item: contentView, attribute: .leading, relatedBy: .equal, toItem: documentView, attribute: .leading, multiplier: 1.0, constant: 0)
            topConstraint = NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: documentView, attribute: .top, multiplier: 1.0, constant: 0)
            trailingConstraint = NSLayoutConstraint(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: documentView, attribute: .trailing, multiplier: 1.0, constant: 0)
        }
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint])
    }
    #elseif canImport(UIKit)
    public func set(rootView: RootView) {
        setup(rootView: rootView)
    }
    #endif
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setupRootViewConstraints() {
        guard let rootView = rootView else {
            return
        }
        let leadingConstraint, trailingConstraint, topConstraint, bottomContrant, heightContrant, widthContrant: NSLayoutConstraint
        if #available(iOS 9.0, tvOS 9.0, macOS 10.13, *) {
            leadingConstraint = rootView.leadingAnchor.constraint(equalTo: constraintsRoot.leadingAnchor)
            trailingConstraint = rootView.trailingAnchor.constraint(equalTo: constraintsRoot.trailingAnchor)
            topConstraint = rootView.topAnchor.constraint(equalTo: constraintsRoot.topAnchor)
            bottomContrant = rootView.bottomAnchor.constraint(equalTo: constraintsRoot.bottomAnchor)
            heightContrant = rootView.heightAnchor.constraint(equalTo: constraintsRoot.heightAnchor)
            widthContrant = rootView.widthAnchor.constraint(equalTo: constraintsRoot.widthAnchor)
        } else {
            leadingConstraint = NSLayoutConstraint(item: rootView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0)
            trailingConstraint = NSLayoutConstraint(item: rootView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
            topConstraint = NSLayoutConstraint(item: rootView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
            bottomContrant = NSLayoutConstraint(item: rootView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
            heightContrant = NSLayoutConstraint(item: rootView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
            widthContrant = NSLayoutConstraint(item: rootView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0.0)
        }
        heightContrant.priority = .defaultLow
        widthContrant.priority = .defaultLow
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomContrant, heightContrant, widthContrant])
    }
    
    private var constraintsRoot: View {
        #if canImport(UIKit)
        return self
        #elseif canImport(AppKit)
        if let documentView {
            return documentView
        } else {
            fatalError("documentView is nil")
        }
        #endif
    }
}
