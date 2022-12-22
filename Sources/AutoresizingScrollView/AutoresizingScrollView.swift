//
//  AutoresizingScrollView.swift
//  AutoresizingScrollView
//
//  Created by Roman Podymov on 06/12/2022.
//  Copyright © 2022 AutoresizingScrollView. All rights reserved.
//

import UIKit

public class AutoresizingScrollView<RootView: UIView>: UIScrollView {
    public weak var rootView: RootView? {
        willSet {
            rootView?.removeFromSuperview()
        }
        
        didSet {
            guard let rootView = rootView else {
                return
            }
            rootView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(rootView)
            setupRootViewConstraints()
        }
    }
    
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
        if #available(iOS 9.0, tvOS 9.0, *) {
            leadingConstraint = rootView.leadingAnchor.constraint(equalTo: leadingAnchor)
            trailingConstraint = rootView.trailingAnchor.constraint(equalTo: trailingAnchor)
            topConstraint = rootView.topAnchor.constraint(equalTo: topAnchor)
            bottomContrant = rootView.bottomAnchor.constraint(equalTo: bottomAnchor)
            heightContrant = rootView.heightAnchor.constraint(equalTo: heightAnchor)
            widthContrant = rootView.widthAnchor.constraint(equalTo: widthAnchor)
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
}
