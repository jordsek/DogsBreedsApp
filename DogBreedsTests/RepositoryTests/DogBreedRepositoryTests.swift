//
//  DogBreedRepositoryTests.swift
//  DogBreedTests
//
//  Created by Jordan Isac on 19/07/2023.
//

import XCTest
@testable import DogBreeds
final class DogBreedRepositoryTests: XCTestCase {

    var fakeNetworkManager: FakeNetworkManager!
    var breedRepositoryImplementation: BreedRepositoryImplementation!
    
    override func setUpWithError() throws {
        fakeNetworkManager = FakeNetworkManager()
        breedRepositoryImplementation = BreedRepositoryImplementation(networkManager: fakeNetworkManager)
    }

    override func tearDownWithError() throws {
        breedRepositoryImplementation = nil
    }
    
    //Test when API passes breed array will return data
    func test_when_get_Breed_Array_is_success() async{
        
        let arr = try! await breedRepositoryImplementation.getBreeds(url: URL(string: "DogBreedSampleTestFile")!)
            XCTAssertNotNil(arr)
            XCTAssertEqual(arr.count, 172)
            XCTAssertEqual(arr.first?.name, "Affenpinscher")
            XCTAssertEqual(arr.first?.bredFor, "Small rodent hunting, lapdog")
            
    }
    
    //Tewst when API fails
    func test_when_get_Brred_list_fails() async throws{
        let list = try? await breedRepositoryImplementation.getBreeds(url: URL(string: "DogBreedNoDataSample.json")!)
               XCTAssertNil(list)
               
           }

           
           func testPerformanceExample() throws {
               // This is an example of a performance test case.
               self.measure {
                   // Put the code you want to measure the time of here.
               }
           }

       }
