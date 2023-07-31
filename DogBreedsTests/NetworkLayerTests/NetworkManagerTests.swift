//
//  NetworkManagerTests.swift
//  DogBreedTests
//
//  Created by Jordan Isac on 19/07/2023.
//

import XCTest
@testable import DogBreed
final class NetworkManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /*
     When api is successful
     get function will return expected data, reading data from locally saved json
     */
    
    func test_get_DogBreed_list_when_api_is_successful() async{
        //reading locl Json file Data
        let bundle = Bundle(for: NetworkManagerTests.self)
        guard let path = bundle.url(forResource: "DogBreedSampleTestFile", withExtension: "json")
            else{ return }
        let data = try? Data(contentsOf: path)
        NetworkingMock.data = data
        
        let networkManager = NetworkManager(urlSession: NetworkingMock())
        let url = URL(string: "http://www.test.com")!
        let actualData = try! await networkManager.getDataFromAPI(url: url)
        XCTAssertEqual(actualData, data)
    }
    
    /*
     When the api is successful but json parsing fails
     Fetch function will return jsonParsingFailed exception
     */
    
    func test_get_DogBreed_list_when_api_fails() async{
        let networkManager = NetworkManager(urlSession: NetworkingMock())
        let url = URL(string: "http://www.test.com")!
        
        do {
            let _ = try await networkManager.getDataFromAPI(url: url)
        }catch {
            XCTAssertEqual(error as! NetworkError, NetworkError.dataNotFound)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
