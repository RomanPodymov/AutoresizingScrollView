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
    #if canImport(AppKit)
    override func loadView() {
        view = View()
        view.frame = NSRect(x: 0, y: 0, width: 300, height: 200)
    }
    #endif
    
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
        rootView.alignment = .top
        rootView.orientation = .horizontal
        #elseif canImport(UIKit)
        rootView.alignment = .center
        rootView.axis = .horizontal
        #endif
        rootView.spacing = 10
        
        scrollView.set(rootView: rootView)
        
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
