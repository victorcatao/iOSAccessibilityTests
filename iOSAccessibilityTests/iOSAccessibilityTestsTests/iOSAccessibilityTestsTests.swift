//
//  iOSAccessibilityTestsTests.swift
//  iOSAccessibilityTestsTests
//
//  Created by Victor Catão on 15/07/23.
//

import XCTest
@testable import iOSAccessibilityTests

final class iOSAccessibilityTestsTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCheckboxButtonAccessibility() throws {
        let myButton = CheckboxButton(frame: CGRect(x: 0, y: 0, width: 200, height: 80))

        XCTAssertTrue(myButton.isAccessibilityElement)
        XCTAssertEqual(myButton.accessibilityTraits, .button)
        
        myButton.isSelected = true
        XCTAssertEqual(myButton.accessibilityTraits, [.button, .selected])
        
        myButton.accessibilityTraits = .notEnabled
        XCTAssertEqual(myButton.accessibilityTraits, .notEnabled)
    }

}

final class CheckboxButton: UIButton {
    
    private var customAccessibilityTraits: UIAccessibilityTraits?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isAccessibilityElement = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var accessibilityTraits: UIAccessibilityTraits {
        get {
            return customAccessibilityTraits ?? (isSelected ? [.button, .selected] : [.button])
        }
        set {
            customAccessibilityTraits = newValue
        }
    }
}
