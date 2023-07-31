//
//  FakeNetworkManager.swift
//  DogBreedTests
//
//  Created by Jordan Isac on 19/07/2023.
//

import Foundation
@testable import DogBreed

class FakeNetworkManager: Fetchable{
    func getDataFromAPI(url: URL) async throws -> Data {
        do{
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json")else {
                            throw NetworkError.invalidURL
                        }
            let data = try Data(contentsOf: path)
            return data
        }catch{
            
            throw NetworkError.dataNotFound
        }


    }
}
