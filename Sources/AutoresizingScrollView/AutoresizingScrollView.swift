//
//  AutoresizingScrollView.swift
//  AutoresizingScrollView
//
//  Created by Roman Podymov on 06/12/2022.
//  Copyright © 2022 AutoresizingScrollView. All rights reserved.
//

import UIKit

class AutoresizingScrollView<RootView: UIView>: UIScrollView {
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
    
    private func setupRootViewConstraints() {
        guard let rootView = rootView else {
            return
        }
        let leadingConstraint = rootView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailingConstraint = rootView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let topConstraint = rootView.topAnchor.constraint(equalTo: topAnchor)
        let bottomContrant = rootView.bottomAnchor.constraint(equalTo: bottomAnchor)
        let heightContrant = rootView.heightAnchor.constraint(equalTo: heightAnchor)
        heightContrant.priority = .defaultLow
        let widthContrant = rootView.widthAnchor.constraint(equalTo: widthAnchor)
        widthContrant.priority = .defaultLow
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomContrant, heightContrant, widthContrant])
    }
}
