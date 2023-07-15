//
//  iOSAccessibilityTestsUITests.swift
//  iOSAccessibilityTestsUITests
//
//  Created by Victor Catão on 15/07/23.
//

import XCTest

final class iOSAccessibilityTestsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = true
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAllElementsExists() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssert(app.images["BG_IMAGE"].exists)
        XCTAssert(app.buttons["CHECKBOX_BUTTON"].exists)
        XCTAssert(app.staticTexts["TERMS_TEXT"].exists)
        XCTAssert(app.buttons["CONFIRM_BUTTON"].exists)
    }
    
    func testAccessibility() throws {
        let app = XCUIApplication()
        app.launch()
        
        try app.performAccessibilityAudit(for: .all) { issue in
            var ignore = false
            if let element = issue.element,
               issue.auditType == .textClipped,
               element.label.contains("By selecting this checkbox") {
                ignore = true
            }
            return ignore
        }
    }
    
}
