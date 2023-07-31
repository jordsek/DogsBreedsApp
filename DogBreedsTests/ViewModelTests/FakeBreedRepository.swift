//
//  FakeBreedRepository.swift
//  DogBreedTests
//
//  Created by Jordan Isac on 20/07/2023.
//

import Foundation
@testable import DogBreed

class FakeBreedRepository: BreedsRepository{
    func getBreeds(url: URL) async throws -> [Breed] {
        do {
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json") else
            {
                throw NetworkError.invalidURL
            }
            let data = try Data(contentsOf: path)
            let lists = try JSONDecoder().decode([Breed].self, from: data)
            return lists
        } catch {
            print(error)
            throw NetworkError.dataNotFound
        }
    }
    
}
