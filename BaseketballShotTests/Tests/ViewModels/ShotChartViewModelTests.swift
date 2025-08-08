//
//  ShotChartViewModelTests.swift
//  BaseketballShot
//
//  Created by Sourabh Sharotri on 08/08/25.
//

import XCTest
import Combine
@testable import BaseketballShot

class ShotChartViewModelTests: XCTestCase {
    
    var viewModel: ShotChartViewModel!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        viewModel = ShotChartViewModel(playerId: "")
    }

    func testInitialShotData() {
        let expectation = XCTestExpectation(description: "Shots data is loaded")
        
        viewModel.$shots
            .dropFirst() // Ignore the initial empty value
            .sink { shots in
                XCTAssertGreaterThan(shots.count, 0)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // Simulate receiving shot data
        viewModel.loadDemoData()
        
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testErrorHandlingWhenDataFetchFails() {
        let expectation = XCTestExpectation(description: "Error state is triggered")
        
        // Simulate a failure in fetching data (you can mock this)
//        viewModel.$errorState
//            .sink { error in
//                XCTAssertNotNil(error)
//                expectation.fulfill()
//            }
//            .store(in: &cancellables)
//        
//        // Trigger the error condition (e.g., no network, server down)
//        viewModel.fetchShotsWithError()
        
        wait(for: [expectation], timeout: 2.0)
    }
}
