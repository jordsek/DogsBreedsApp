//
//  NetworkingMork.swift
//  DogBreedTests
//
//  Created by Jordan Isac on 19/07/2023.
//

import Foundation

@testable import DogBreeds

class NetworkingMock: Networking {
    static var data: Data?
    
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        guard let data = NetworkingMock.data else {
            throw NetworkError.dataNotFound
        }
        return (data, URLResponse())
    }
    
    
}
