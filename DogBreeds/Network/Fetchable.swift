//
//  Fetchable.swift
//  DogBreed
//
//  Created by Jordan Isac on 09/07/2023.
//

import Foundation

protocol Fetchable {
    func getDataFromAPI(url: URL) async throws -> Data
}
