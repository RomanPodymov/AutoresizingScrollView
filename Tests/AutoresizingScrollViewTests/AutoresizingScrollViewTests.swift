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
    
    private func createView(for scrollView: AutoresizingScrollView<UIView>, size: CGFloat, anotherView: UIView?, space: CGFloat?, isHorizontal: Bool) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.rootView!.addSubview(view)
        let firstResultBasicConstraint, secondResultBasicConstraint: NSLayoutConstraint
        if isHorizontal {
            firstResultBasicConstraint = view.topAnchor.constraint(equalTo: scrollView.rootView!.topAnchor)
            secondResultBasicConstraint = view.bottomAnchor.constraint(equalTo: scrollView.rootView!.bottomAnchor)
        } else {
            firstResultBasicConstraint = view.leadingAnchor.constraint(equalTo: scrollView.rootView!.leadingAnchor)
            secondResultBasicConstraint = view.trailingAnchor.constraint(equalTo: scrollView.rootView!.trailingAnchor)
        }
        let resultSizeConstraint: NSLayoutConstraint
        if isHorizontal {
            resultSizeConstraint = view.widthAnchor.constraint(equalToConstant: size)
        } else {
            resultSizeConstraint = view.heightAnchor.constraint(equalToConstant: size)
        }
        NSLayoutConstraint.activate([
            firstResultBasicConstraint,
            secondResultBasicConstraint,
            resultSizeConstraint
        ] + additionalConstraints(view: view, scrollView: scrollView, anotherView: anotherView, space: space, isHorizontal: isHorizontal))
        return view
    }
    
    private func additionalConstraints(view: UIView, scrollView: AutoresizingScrollView<UIView>, anotherView: UIView?, space: CGFloat?, isHorizontal: Bool) -> [NSLayoutConstraint] {
        if let anotherView, let space {
            if isHorizontal {
                return [
                    view.leadingAnchor.constraint(equalTo: anotherView.trailingAnchor, constant: space),
                    view.trailingAnchor.constraint(equalTo: scrollView.rootView!.trailingAnchor)
                ]
            } else {
                return [
                    view.topAnchor.constraint(equalTo: anotherView.bottomAnchor, constant: space),
                    view.bottomAnchor.constraint(equalTo: scrollView.rootView!.bottomAnchor)
                ]
            }
        } else {
            if isHorizontal {
                return [view.leadingAnchor.constraint(equalTo: scrollView.rootView!.leadingAnchor)]
            } else {
                return [view.topAnchor.constraint(equalTo: scrollView.rootView!.topAnchor)]
            }
        }
    }
    
    private func testUI(view: UIView, scrollView: AutoresizingScrollView<UIView>, viewWidth: CGFloat, viewHeight: CGFloat, contentWidth: CGFloat?, contentHeight: CGFloat?) {
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        XCTAssertEqual(scrollView.frame.width, viewWidth)
        XCTAssertEqual(scrollView.frame.height, viewHeight)
        
        XCTAssertNotNil(scrollView.rootView)
        XCTAssertEqual(scrollView.rootView!.frame.width, contentWidth ?? viewWidth)
        XCTAssertEqual(scrollView.rootView!.frame.height, contentHeight ?? viewHeight)
        
        XCTAssertEqual(scrollView.contentSize.width, contentWidth ?? viewWidth)
        XCTAssertEqual(scrollView.contentSize.height, contentHeight ?? viewHeight)
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
        
        let view1 = createView(for: scrollView, size: firstViewHeight, anotherView: nil, space: nil, isHorizontal: false)
        _ = createView(for: scrollView, size: secondViewHeight, anotherView: view1, space: view1view2Space, isHorizontal: false)

        testUI(view: view, scrollView: scrollView, viewWidth: viewWidth, viewHeight: viewHeight, contentWidth: nil, contentHeight: contentHeight)
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
                
        let view1 = createView(for: scrollView, size: firstViewWidth, anotherView: nil, space: nil, isHorizontal: true)
        _ = createView(for: scrollView, size: secondViewWidth, anotherView: view1, space: view1view2Space, isHorizontal: true)

        testUI(view: view, scrollView: scrollView, viewWidth: viewWidth, viewHeight: viewHeight, contentWidth: contentWidth, contentHeight: nil)
    }
}
