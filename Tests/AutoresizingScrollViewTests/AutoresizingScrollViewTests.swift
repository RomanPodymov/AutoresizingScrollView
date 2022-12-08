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
    private func createScrollView(for view: UIView, fixedHeight: CGFloat? = nil) -> AutoresizingScrollView<UIView> {
        let scrollView = AutoresizingScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let scrollViewLeadingConstraint = scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let scrollViewTrailingConstraint = scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let scrollViewTopConstraint = scrollView.topAnchor.constraint(equalTo: view.topAnchor)
        let additionalConstraint: NSLayoutConstraint
        if let fixedHeight {
            additionalConstraint = scrollView.heightAnchor.constraint(equalToConstant: fixedHeight)
        } else {
            additionalConstraint = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        }
        NSLayoutConstraint.activate([scrollViewLeadingConstraint, scrollViewTrailingConstraint, scrollViewTopConstraint, additionalConstraint])
        
        let rootView = UIView()
        scrollView.rootView = rootView
        return scrollView
    }
    
    private func createView(for scrollView: AutoresizingScrollView<UIView>, height: CGFloat, anotherView: UIView?, space: CGFloat?) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.rootView!.addSubview(view)
        let resultLeadingConstraint = view.leadingAnchor.constraint(equalTo: scrollView.rootView!.leadingAnchor)
        let resultTrailingConstraint = view.trailingAnchor.constraint(equalTo: scrollView.rootView!.trailingAnchor)
        let resultHeightConstraint = view.heightAnchor.constraint(equalToConstant: height)
        let additionalConstraints: [NSLayoutConstraint]
        if let anotherView, let space {
            additionalConstraints = [
                view.topAnchor.constraint(equalTo: anotherView.bottomAnchor, constant: space),
                view.bottomAnchor.constraint(equalTo: scrollView.rootView!.bottomAnchor)
            ]
        } else {
            additionalConstraints = [view.topAnchor.constraint(equalTo: scrollView.rootView!.topAnchor)]
        }
        NSLayoutConstraint.activate([resultLeadingConstraint, resultTrailingConstraint, resultHeightConstraint] + additionalConstraints)
        return view
    }
    
    func testContentHeight() {
        let viewWidth: CGFloat = 300
        let viewHeight: CGFloat = 1000
        let firstViewHeight: CGFloat = 600
        let secondViewHeight: CGFloat = 700
        let view1view2Space: CGFloat = 100
        let contentHeight: CGFloat = firstViewHeight + view1view2Space + secondViewHeight
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        let scrollView = createScrollView(for: view)
        
        let view1 = createView(for: scrollView, height: firstViewHeight, anotherView: nil, space: nil)
        _ = createView(for: scrollView, height: secondViewHeight, anotherView: view1, space: view1view2Space)

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
        
        let scrollView = createScrollView(for: view, fixedHeight: viewHeight)
                
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        scrollView.rootView!.addSubview(view1)
        let view1LeadingConstraint = view1.leadingAnchor.constraint(equalTo: scrollView.rootView!.leadingAnchor)
        let view1BottomConstraint = view1.bottomAnchor.constraint(equalTo: scrollView.rootView!.bottomAnchor)
        let view1TopConstraint = view1.topAnchor.constraint(equalTo: scrollView.rootView!.topAnchor)
        let view1WidthConstraint1 = view1.widthAnchor.constraint(equalToConstant: firstViewWidth)
        NSLayoutConstraint.activate([view1LeadingConstraint, view1BottomConstraint, view1TopConstraint, view1WidthConstraint1])
                
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        scrollView.rootView!.addSubview(view2)
        let view2TopConstraint = view2.topAnchor.constraint(equalTo: scrollView.rootView!.topAnchor)
        let view2TrailingConstraint = view2.trailingAnchor.constraint(equalTo: scrollView.rootView!.trailingAnchor)
        let view2BottomConstraint = view2.bottomAnchor.constraint(equalTo: scrollView.rootView!.bottomAnchor)
        let view1view2LeadingConstraint = view1.trailingAnchor.constraint(equalTo: view2.leadingAnchor, constant: -view1view2Space)
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
