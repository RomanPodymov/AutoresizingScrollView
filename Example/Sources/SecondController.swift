//
//  SecondController.swift
//  AutoresizingScrollViewExample
//
//  Created by Roman Podymov on 07/02/2023.
//  Copyright © 2023 AutoresizingScrollViewExample. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif
import AutoresizingScrollView

class SecondController: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let scrollView = AutoresizingScrollView<StackView>()
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let rootView = StackView()
        #if canImport(AppKit)
        rootView.alignment = .centerX
        rootView.orientation = .vertical
        #elseif canImport(UIKit)
        rootView.alignment = .center
        rootView.axis = .horizontal
        #endif
        rootView.spacing = 10
        
        scrollView.rootView = rootView
        
        (0..<100).forEach {
            let button = Button()
            button.title = String($0)
            button.titleColor = .black
            button.backgroundColor = .red
            button.title = String($0)
            rootView.addArrangedSubview(button)
        }
    }
}
