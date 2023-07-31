//
//  VideoModel.swift
//  DogBreed
//
//  Created by Jordan Isac on 07/07/2023.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumnail: String{
        "video-\(id)"
    }
}
