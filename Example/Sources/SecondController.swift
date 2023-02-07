//
//  SecondController.swift
//  AutoresizingScrollViewExample
//
//  Created by Roman Podymov on 07/02/2023.
//  Copyright © 2023 AutoresizingScrollViewExample. All rights reserved.
//

import UIKit
import AutoresizingScrollView

class SecondController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let scrollView = AutoresizingScrollView<UIStackView>()
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let rootView = UIStackView()
        rootView.alignment = .center
        rootView.spacing = 10
        rootView.axis = .horizontal
        
        scrollView.rootView = rootView
        
        (0..<100).forEach {
            let button = UIButton()
            button.backgroundColor = .red
            button.setTitleColor(.black, for: .normal)
            button.setTitle(String($0), for: .normal)
            rootView.addArrangedSubview(button)
        }
    }
}
