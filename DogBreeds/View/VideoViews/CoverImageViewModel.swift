//
//  CoverImageViewModel.swift
//  DogBreed
//
//  Created by Jordan Isac on 19/07/2023.
//

import Foundation
import SwiftUI

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        //1. Locate the jsson file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) from bundle.")
        }
        
        //2. Create property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        //3. Create decoder
        let decoder = JSONDecoder()
        
        //4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        //Return the ready to use data
        return loaded
    }
}
