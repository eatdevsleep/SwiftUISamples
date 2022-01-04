//
//  EventAggregatorTests.swift
//  EventAggregatorTests
//
//  Created by Peter Booth on 2022-01-03.
//

import XCTest
@testable import EventAggregator

class EventAggregatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    struct TestPayload {
        let testString : String
    }

    // method name must begin with "test" to be classified as a test
    func testPublishAndSubscribe() throws {
        // Arrange
        let testString = "Test"
        let testPayload = TestPayload(testString: testString)
        let eventAggregator: PEventAggregator = EventAggregator()
        // https://developer.apple.com/documentation/xctest/asynchronous_tests_and_expectations/testing_asynchronous_operations_with_expectations
        let expectation = XCTestExpectation(description: "Receive Event")
        
        // Act
        let cancellation = eventAggregator.Subscribe({(tp: TestPayload) -> Void in
            XCTAssertEqual(testString, tp.testString)
            expectation.fulfill()
        })
        eventAggregator.Publish(testPayload)
        
        // Assert
        wait(for: [expectation], timeout: 1.0)
        cancellation.cancel()
    }

}
