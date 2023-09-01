//  PrincipalViewUITesting.swift
//  OracleTestUITests
//  Created by Jael  on 31/08/23.

import XCTest
@testable import OracleTest

final class PrincipalViewUITesting: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func test_SplashScreen() throws {
        // Arrange
        let splashScreen = app.otherElements["SplashScreenView"]
        let principalView = app.otherElements["PrincipalView"]
        
        // Act
        let splashScreenExpectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == false"), object: splashScreen)
        XCTWaiter().wait(for: [splashScreenExpectation], timeout: 10)
        
        // Assert
        XCTAssertFalse(principalView.exists)
    }
    
    func test_CoinCellTap() throws {
        // Arrange
        let coinCell = app.cells.element(boundBy: 0)
        let coinCellName = "Bitcoin"
        
        // Act
        let splashScreen = app.otherElements["SplashScreenView"]
        let splashScreenExpectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == false"), object: splashScreen)
        XCTWaiter().wait(for: [splashScreenExpectation], timeout: 10)
        
        // Assert
        XCTAssertTrue(coinCell.waitForExistence(timeout: 10))
        
        // Act
        coinCell.tap()
        
        // Assert
        XCTAssertTrue(app.staticTexts["Name: \(coinCellName)"].exists)
    }
    
    func test_PullToRefresh() throws {
        // Arrange
        let coinEtherumCell = app.cells.element(boundBy: 1)
        
        // Act
        let splashScreen = app.otherElements["SplashScreenView"]
        let splashScreenExpectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "exists == false"), object: splashScreen)
        XCTWaiter().wait(for: [splashScreenExpectation], timeout: 10)
        
        // Assert
        XCTAssertTrue(coinEtherumCell.waitForExistence(timeout: 10))
        
        // Act
        app.swipeDown()
        
        // Assert
        let coinCellAfterRefresh = app.cells.element(boundBy: 0)
        XCTAssertTrue(coinCellAfterRefresh.waitForExistence(timeout: 10))
    }
}
