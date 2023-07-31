///
//  BreedRepository.swift
//  DogBreed
//
//  Created by Jordan Isac on 09/07/2023.
//

import Foundation

protocol BreedsRepository {
    func getBreeds(url: URL) async throws -> [Breed]
}
