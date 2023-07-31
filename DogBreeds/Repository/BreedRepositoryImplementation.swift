
//
//  BrredRepositoryImplementation.swift
//  DogBreed
//
//  Created by Jordan Isac on 10/07/2023.
//

import Foundation
final class BreedRepositoryImplementation: BreedsRepository {
    
    var networkManager: Fetchable
    init(networkManager: Fetchable) {
            self.networkManager = networkManager
        }
    func getBreeds(url: URL) async throws -> [Breed] {
        do {
            let data = try await networkManager.getDataFromAPI(url: url)
            let result = try JSONDecoder().decode([Breed].self, from: data)
            return result
        }catch {
            throw error
        }
    }
    
    
}
