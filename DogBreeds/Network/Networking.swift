//
//  Networking.swift
//  DogBreed
//
//  Created by Jordan Isac on 09/07/2023.
//

import Foundation

protocol Networking{
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension Networking {
    func data(url: URL) async throws -> (Data, URLResponse){
        try await data(from: url, delegate: nil)
    }
}
extension URLSession: Networking{}
