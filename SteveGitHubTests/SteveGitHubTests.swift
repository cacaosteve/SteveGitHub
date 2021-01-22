//
//  SteveGitHubTests.swift
//  SteveGitHubTests
//
//  Created by steve on 1/15/21.
//

import XCTest
import Combine
import OHHTTPStubs
import OHHTTPStubsSwift
@testable import SteveGitHub

class SteveGitHubTests: XCTestCase {
    var gitHubViewModel: GitHubViewModel!
    // this is a property in your test class
    var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        gitHubViewModel = GitHubViewModel()
        
        do {
            if let bundlePath = Bundle.main.path(forResource: "github",
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                stub(condition: isHost("github.com")) { (URLRequest) -> HTTPStubsResponse in
                    return HTTPStubsResponse(data: jsonData, statusCode: 200, headers: nil)
                }
            }
        } catch {
            print(error)
        }
    }
    
    override func tearDown() {
        gitHubViewModel = nil
        super.tearDown()
    }
    
    func testCommits() {
        let expectation = XCTestExpectation(description: "Check if API connects and publishes in viewModel")
        _ = GitHubViewModel().$commits.sink(receiveCompletion: { print ($0)
        },
        receiveValue: {
            print ($0)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
    }
    
    func testInitGitHubViewModel() throws {
        XCTAssertNotNil(gitHubViewModel)
    }
    
    func testAddingToCancellable() throws {
        XCTAssertNotNil(gitHubViewModel.cancellables)
        gitHubViewModel.getCommits()
        XCTAssertEqual(gitHubViewModel.cancellables.count, 1)
    }
    
    func testCommitsExist() throws {
        XCTAssertNotNil(gitHubViewModel.commits)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            gitHubViewModel.getCommits()
        }
    }
    
}
