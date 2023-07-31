//
//  BreedViewModelTest.swift
//  DogBreedTests
//
//  Created by Jordan Isac on 20/07/2023.
//

import XCTest
@testable import DogBreed
@MainActor
final class BreedViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
       
    }

    //When url is correct, you should have some data in BrredArray
    func testGetBreedList_When_data_isCorrect() async{
        let fakeBreedRepository = FakeBreedRepository()
        let breedViewModel =  BreedViewModel(repository: fakeBreedRepository)
        
        
        await breedViewModel.getBreedList(urlString: "DogBreedSampleTestFile")
        let breedList =   breedViewModel.breedArray
        XCTAssertNotNil(breedList)
        XCTAssertEqual("Affenpinscher", breedList.first?.name)
        XCTAssertEqual("Small rodent hunting, lapdog", breedList.first?.bredFor)
        XCTAssertEqual("Germany, France", breedList.first?.origin)
        XCTAssertEqual(breedList.count, 172)

        let  localError =  breedViewModel.customError
        XCTAssertNil(localError)
    }

    //When url is incorrect, it will return immediately, no data in breedArray
    func test_getBreedList_When_Url_isNotGiven() async {
        let fakeBreedRepository = FakeBreedRepository()
        let breedViewModel =  BreedViewModel(repository: fakeBreedRepository)

        await breedViewModel.getBreedList(urlString: "")
        let breedList =  breedViewModel.breedArray
        XCTAssertEqual(breedList.count, 0)

        let localError =  breedViewModel.customError
        XCTAssertEqual(localError, .invalidURL)

        XCTAssertNotNil(localError)
    }
    
    //When url is an empty file
    func testGetBreedList_when_APIFails() async{
        let fakeBreedRepository = FakeBreedRepository()
        let breedViewModel =  BreedViewModel(repository: fakeBreedRepository)

        XCTAssertNotNil(breedViewModel)

        await breedViewModel.getBreedList(urlString: "DogBreedNoDataSample")
        let breedList =  breedViewModel.breedArray
        XCTAssertEqual(breedList.count, 0)

        let localError = breedViewModel.customError
        XCTAssertNotNil(localError)

        XCTAssertEqual(localError, NetworkError.dataNotFound)
    }

    //When the URL is incorrect
    func testGetBreedList_When_URL_is_Incorrect() async{
        let fakeBreedRepository = FakeBreedRepository()
        let breedViewModel =  BreedViewModel(repository: fakeBreedRepository)

        XCTAssertNotNil(breedViewModel)

        await breedViewModel.getBreedList(urlString: "BreedSampleTestFileWrongURL")

        let breedList =  breedViewModel.breedArray
        XCTAssertEqual(breedList.count, 0)

        let localError =  breedViewModel.customError
        XCTAssertNotNil(localError)

        XCTAssertEqual(localError, NetworkError.dataNotFound)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
