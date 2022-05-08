//
//  Rapptr_iOS_TestUITests.swift
//  Rapptr iOS TestUITests
//
//  Created by Rutkoski,Augustus on 5/8/22.
//

import XCTest

class Rapptr_iOS_TestUITests: XCTestCase {

    func testVerifyMenuButtonsExist() throws {
        let app = XCUIApplication()
        app.launchArguments.append("-disableAnimations")
        app.launch()
        
        XCTAssert(app.staticTexts["CHAT"].exists)
        XCTAssert(app.staticTexts["LOGIN"].exists)
        XCTAssert(app.staticTexts["ANIMATION"].exists)
        
    }

}
