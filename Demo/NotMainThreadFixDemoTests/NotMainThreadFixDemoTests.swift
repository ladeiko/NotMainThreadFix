//
//  NotMainThreadFixDemoTests.swift
//  NotMainThreadFixDemoTests
//
//  Created by Siarhei Ladzeika on 11/1/20.
//

import XCTest
@testable import NotMainThreadFixDemo

class NotMainThreadFixDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test() throws {
        let e = XCTestExpectation()

        var bgApp: UIApplication!
        var bgApplicationState: UIApplication.State!
        var bgDelegate: UIApplicationDelegate!

        DispatchQueue.global().async {
            bgApp = UIApplication.shared
            bgApplicationState = UIApplication.shared.applicationState
            bgDelegate = UIApplication.shared.delegate
            e.fulfill()
        }

        wait(for: [e], timeout: 10)

        let app = UIApplication.shared
        let applicationState = UIApplication.shared.applicationState
        let delegate = UIApplication.shared.delegate

        XCTAssertTrue(app === bgApp)
        XCTAssertTrue(applicationState == bgApplicationState)
        XCTAssertTrue(delegate === bgDelegate)
    }

}
