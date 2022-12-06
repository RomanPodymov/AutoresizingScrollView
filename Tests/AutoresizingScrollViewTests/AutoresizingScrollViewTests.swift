//
//  AutoresizingScrollViewTests.swift
//  AutoresizingScrollViewTests
//
//  Created by Roman Podymov on 06/12/2022.
//  Copyright © 2022 AutoresizingScrollView. All rights reserved.
//

import XCTest
@testable import AutoresizingScrollView

final class AutoresizingScrollViewTests: XCTestCase {
    func testContentHeight() {
        let viewWidth: CGFloat = 300
        let viewHeight: CGFloat = 1000
        let firstViewHeight: CGFloat = 600
        let secondViewHeight: CGFloat = 700
        let view1view2Space: CGFloat = 100
        let contentHeight: CGFloat = firstViewHeight + view1view2Space + secondViewHeight
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        
        let scrollView = AutoresizingScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        let scrollViewLeadingConstraint = scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let scrollViewTrailingConstraint = scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let scrollViewTopConstraint = scrollView.topAnchor.constraint(equalTo: view.topAnchor)
        let scrollViewBottomContrant = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        NSLayoutConstraint.activate([scrollViewLeadingConstraint, scrollViewTrailingConstraint, scrollViewTopConstraint, scrollViewBottomContrant])
        
        let rootView = UIView()
        scrollView.rootView = rootView
                
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        rootView.addSubview(view1)
        let view1LeadingConstraint = view1.leadingAnchor.constraint(equalTo: rootView.leadingAnchor)
        let view1TrailingConstraint = view1.trailingAnchor.constraint(equalTo: rootView.trailingAnchor)
        let view1TopConstraint = view1.topAnchor.constraint(equalTo: rootView.topAnchor)
        let view1HeightConstraint1 = view1.heightAnchor.constraint(equalToConstant: firstViewHeight)
        NSLayoutConstraint.activate([view1LeadingConstraint, view1TrailingConstraint, view1TopConstraint, view1HeightConstraint1])
                
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        rootView.addSubview(view2)
        let view2LeadingConstraint = view2.leadingAnchor.constraint(equalTo: rootView.leadingAnchor)
        let view2TrailingConstraint = view2.trailingAnchor.constraint(equalTo: rootView.trailingAnchor)
        let view2BottomConstraint = view2.bottomAnchor.constraint(equalTo: rootView.bottomAnchor)
        let view1view2TopConstraint = view1.bottomAnchor.constraint(equalTo: view2.topAnchor, constant: -view1view2Space)
        let view2HeightConstraint = view2.heightAnchor.constraint(equalToConstant: secondViewHeight)
        NSLayoutConstraint.activate([view2LeadingConstraint, view2TrailingConstraint, view2BottomConstraint, view1view2TopConstraint, view2HeightConstraint])

        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        XCTAssertEqual(scrollView.frame.width, viewWidth)
        XCTAssertEqual(scrollView.frame.height, viewHeight)
        
        XCTAssertNotNil(scrollView.rootView)
        XCTAssertEqual(scrollView.rootView!.frame.width, viewWidth)
        XCTAssertEqual(scrollView.rootView!.frame.height, contentHeight)
        
        XCTAssertEqual(scrollView.contentSize.width, viewWidth)
        XCTAssertEqual(scrollView.contentSize.height, contentHeight)
    }
    
    func testContentWidth() {
        let viewWidth: CGFloat = 200
        let viewHeight: CGFloat = 300
        let firstViewWidth: CGFloat = 600
        let secondViewWidth: CGFloat = 700
        let view1view2Space: CGFloat = 100
        let contentWidth: CGFloat = firstViewWidth + view1view2Space + secondViewWidth
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        
        let scrollView = AutoresizingScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        let scrollViewLeadingConstraint = scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let scrollViewTrailingConstraint = scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let scrollViewTopConstraint = scrollView.topAnchor.constraint(equalTo: view.topAnchor)
        let scrollViewHeightContrant = scrollView.heightAnchor.constraint(equalToConstant: viewHeight)
        NSLayoutConstraint.activate([scrollViewLeadingConstraint, scrollViewTrailingConstraint, scrollViewTopConstraint, scrollViewHeightContrant])
        
        let rootView = UIView()
        scrollView.rootView = rootView
                
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        rootView.addSubview(view1)
        let view1LeadingConstraint = view1.leadingAnchor.constraint(equalTo: rootView.leadingAnchor)
        let view1BottomConstraint = view1.bottomAnchor.constraint(equalTo: rootView.bottomAnchor)
        let view1TopConstraint = view1.topAnchor.constraint(equalTo: rootView.topAnchor)
        let view1WidthConstraint1 = view1.widthAnchor.constraint(equalToConstant: firstViewWidth)
        NSLayoutConstraint.activate([view1LeadingConstraint, view1BottomConstraint, view1TopConstraint, view1WidthConstraint1])
                
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        rootView.addSubview(view2)
        let view2TopConstraint = view2.topAnchor.constraint(equalTo: rootView.topAnchor)
        let view2TrailingConstraint = view2.trailingAnchor.constraint(equalTo: rootView.trailingAnchor)
        let view2BottomConstraint = view2.bottomAnchor.constraint(equalTo: rootView.bottomAnchor)
        let view1view2LeadingConstraint = view1.trailingAnchor.constraint(equalTo: view2.leadingAnchor, constant: view1view2Space)
        let view2WidthConstraint = view2.widthAnchor.constraint(equalToConstant: secondViewWidth)
        NSLayoutConstraint.activate([view2TopConstraint, view2TrailingConstraint, view2BottomConstraint, view1view2LeadingConstraint, view2WidthConstraint])

        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        XCTAssertEqual(scrollView.frame.width, viewWidth)
        XCTAssertEqual(scrollView.frame.height, viewHeight)
        
        XCTAssertNotNil(scrollView.rootView)
        XCTAssertEqual(scrollView.rootView!.frame.height, viewHeight)
        XCTAssertEqual(scrollView.rootView!.frame.width, contentWidth)
        
        XCTAssertEqual(scrollView.contentSize.height, viewHeight)
        XCTAssertEqual(scrollView.contentSize.width, contentWidth)
    }
}
