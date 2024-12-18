//
//  DataViewModelTests.swift
//  NetworkingFetchingDataTests
//
//  Created by Bhuiyan Wasif on 11/21/24.
//

import XCTest
@testable import NetworkingFetchingData

final class DataViewModelTests: XCTestCase {
    var viewModel : PlanetViewModel!
    var dummyNetworkManager: DummyNetworkManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //for writing test cases we shouldn't make api calls, we should rather use dummy data
//        viewModel = PlanetViewModel(networkManager: NetworkManager())
        
        //Given
        dummyNetworkManager = DummyNetworkManager()
        viewModel = PlanetViewModel(networkManager: dummyNetworkManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        dummyNetworkManager = nil
    }

    func testGetPlanets_whenWeAreExpectingCorrectOutput() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        //When
        dummyNetworkManager.urlPath = "DummyTestData"
        await viewModel.getPlanetData()
        
        //then
//        let expectation = expectation(description: "Correct inputs give us correct output")
        XCTAssertNotNil(viewModel)
        XCTAssertGreaterThan(viewModel.planetData.count, 0)
        XCTAssertEqual(viewModel.planetData.count, 4)
        
        let planet1 = viewModel.planetData[0]
        XCTAssertEqual(planet1.name, "Tatooine")
        XCTAssertEqual(planet1.diameter, "10465")
        XCTAssertEqual(planet1.population, "200000")
        XCTAssertEqual(planet1.climate, "arid")
        XCTAssertEqual(planet1.gravity, "1 standard")
        
        //await fulfillment(of: [expectation])
    }
    
    func testGetPlanets_withInvalidInput() async throws {
        
        //When
        dummyNetworkManager.urlPath = "File"
        await viewModel.getPlanetData()
        
        //then
        XCTAssertEqual(viewModel.planetData.count, 0)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
