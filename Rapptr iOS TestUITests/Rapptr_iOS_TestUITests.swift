//
//  Rapptr_iOS_TestUITests.swift
//  Rapptr iOS TestUITests
//
//  Created by Rutkoski,Augustus on 5/8/22.
//

import XCTest

let timeout = TimeInterval(1)

class Rapptr_iOS_TestUITests: XCTestCase {
    
    override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launchArguments.append("-disableAnimations")
        app.launch()
    }

    func testVerifyMenuButtonsExist() throws {
        let app = XCUIApplication()
        
        //Verify that all 3 buttons exist on menu view
        verifyAtMenuView(app: app)
    }
    
    func testChatFlow() throws {
        let app = XCUIApplication()

        //Nav to chat
        app.staticTexts["CHAT"].waitForExistenceThenTapOrFail()
        
        //Tap on header as a way to verify we moved VCs
        app.staticTexts["Chat"].waitForExistenceThenTapOrFail()

        //Nav back to menu
        app.navigationBars["Chat"].buttons["Coding Tasks"].tap()
        
        //Verify back at menu view
        verifyAtMenuView(app: app)
    }

    func testHappyPathLoginFlow() throws {
        let app = XCUIApplication()
        
        navigateToLoginAndLogin(app: app,
                                email: "info@rapptrlabs.com",
                                password: "Test123")
        
        //Verify success alert pops up, if failure check credentials/network connectivity
        let successAlert = app.alerts["Login Success"]
        successAlert.waitForExistence()
        XCTAssert(successAlert.exists)

        //Press Ok to go back to menu view
        successAlert.scrollViews.otherElements.buttons["Ok"].tap()
        
        //Verify back at menu view
        verifyAtMenuView(app: app)
    }
    
    func testErrorPathLoginFlow() throws {
        let app = XCUIApplication()

        navigateToLoginAndLogin(app: app,
                                email: "wrong@email.com",
                                password: "wrongpassword")
        
        //Verify failure alert pops up
        let failureAlert = app.alerts["Login Failure"]
        failureAlert.waitForExistence()
        XCTAssert(failureAlert.exists)

        //Press Ok to dismiss error
        failureAlert.scrollViews.otherElements.buttons["Ok"].tap()
    }
    
    func testAnimationFlow() throws {
        let app = XCUIApplication()

        //Nav to animation
        app.staticTexts["ANIMATION"].waitForExistenceThenTapOrFail()
        
        //Verify logo is not hidden with accessibility ID
        let logo = app.images["ic_logo"]
        logo.waitForExistence()
        
        XCTAssertEqual(logo.identifier, "visible_logo")

        //Tap button to hide logo
        app.buttons["FADE OUT"].waitForExistenceThenTapOrFail()
        
        //Verify logo is hidden
        XCTAssertEqual(logo.identifier, "hidden_logo")
        
        //Tap button to unhide logo
        app.buttons["FADE IN"].waitForExistenceThenTapOrFail()
        
        //Verify logo is visible
        XCTAssertEqual(logo.identifier, "visible_logo")
        
        //Swipe logo to drag
        logo.swipeDown(velocity: XCUIGestureVelocity(floatLiteral: 300))
        logo.swipeUp(velocity: XCUIGestureVelocity(floatLiteral: 300))
        logo.swipeLeft(velocity: XCUIGestureVelocity(floatLiteral: 300))
        logo.swipeRight(velocity: XCUIGestureVelocity(floatLiteral: 300))
        
        //Tap back button to nav back to menu view
        app.navigationBars["Animation"].buttons["Coding Tasks"].tap()
        
        //Verify back at menu view
        verifyAtMenuView(app: app)
    }
}

// MARK: - Helper functions
extension Rapptr_iOS_TestUITests {
    
    /// Navigates to login page and then inputs the
    /// provided email and password into appropriate
    /// fields
    /// - Parameters:
    ///   - app: test app
    ///   - email: email string
    ///   - password: password string
    func navigateToLoginAndLogin(app: XCUIApplication, email: String, password: String) {
        //Nav to login
        app.staticTexts["LOGIN"].waitForExistenceThenTapOrFail()
        
        //Type in test email
        let emailTextField = app.textFields["Email"]
        emailTextField.waitForExistenceThenTapOrFail()
        emailTextField.typeText(email)
        
        //Type in test password
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.waitForExistenceThenTapOrFail()
        passwordTextField.typeText(password)
        
        //Press login button
        let loginBtn = app.buttons["LOGIN"]
        loginBtn.waitForExistenceThenTapOrFail()
    }
    
    /// Verifies we are back at the menu view by checking if
    /// menu view buttons are visible
    /// - Parameter app: Test app
    func verifyAtMenuView(app: XCUIApplication) {
        
        let chatMenuButton = app.staticTexts["CHAT"]
        chatMenuButton.waitForExistence()
        
        let loginMenuButton = app.staticTexts["LOGIN"]
        loginMenuButton.waitForExistence()
        
        let animationMenuButton = app.staticTexts["ANIMATION"]
        animationMenuButton.waitForExistence()
        
        //Verify that all 3 buttons exist on menu view
        XCTAssert(chatMenuButton.exists)
        XCTAssert(loginMenuButton.exists)
        XCTAssert(animationMenuButton.exists)
    }
}

// MARK: - Helper extension
extension XCUIElement {

    @discardableResult
    func waitForExistence() -> Bool {
        self.waitForExistence(timeout: timeout)
    }
    
    func waitForExistenceThenTapOrFail(_ message: String? = nil, file: String = #file, line: Int = #line) {
        if self.waitForExistence() {
            self.tap()
        } else {
            let message = message ?? self.title
            XCTFail("\(file) \(line) \(message)")
        }
    }
}
