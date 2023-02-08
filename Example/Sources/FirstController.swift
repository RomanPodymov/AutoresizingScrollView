//
//  FirstController.swift
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

class FirstController: ViewController {
    #if canImport(AppKit)
    override func loadView() {
        self.view = View()
        self.view.frame = NSRect(x: 0, y: 0, width: 300, height: 200)
    }
    #endif
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
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
        rootView.axis = .vertical
        #endif
        rootView.spacing = 10
        
        scrollView.set(rootView: rootView)
        
        (0..<100).forEach {
            let button = Button()            
            button.title = String($0)
            button.titleColor = .black
            button.backgroundColor = .yellow
            rootView.addArrangedSubview(button)
        }
    }
}
