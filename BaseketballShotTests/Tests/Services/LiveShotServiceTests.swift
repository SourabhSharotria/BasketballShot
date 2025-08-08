//
//  LiveShotServiceTests.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 08/08/25.
//

import XCTest
@testable import BaseketballShot
import Combine

class LiveShotServiceTests: XCTestCase {
    
    var service: LiveShotService!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        service = LiveShotService()
    }
    
    func testFetchingLiveShots() {
        let expectation = XCTestExpectation(description: "Live shots are fetched")
        
        service.shotsPublisher
            .sink { shots in
                XCTAssertGreaterThan(shots.count, 0)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // Simulate receiving data (you can mock this)
        service.startLiveGame()
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testErrorHandlingOnNetworkFailure() {
        let expectation = XCTestExpectation(description: "Error is triggered on network failure")
        
        service.shotsPublisher
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    XCTAssertNotNil(error)
                    expectation.fulfill()
                default:
                    break
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
        
        // Simulate network failure
//        service.simulateNetworkFailure()
        
        wait(for: [expectation], timeout: 2.0)
    }
}
