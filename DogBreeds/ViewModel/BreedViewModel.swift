//
//  BreedViewModel.swift
//  DogBreed
//
//  Created by Jordan Isac on 09/07/2023.
//

import Foundation

@MainActor
class BreedViewModel: ObservableObject{
    
    @Published var breedArray: [Breed] = []
    @Published var breeds : Breed?
   // @Published var characters : Character?
    //@Published var characterArray: [Amiibo] = []
    @Published var customError: NetworkError?
    
    let repository: BreedsRepository
    init(repository: BreedsRepository){
        self.repository = repository
    }
    
    func getBreedList(urlString: String) async{
        guard let url = URL(string:urlString) else {
            customError = NetworkError.invalidURL
            return
        }
        do {
            let result = try await repository.getBreeds(url: url)
            
            self.breedArray =  result.self
                
            //}
            
        }catch let someError {
            print(someError.localizedDescription)
            if someError as? NetworkError == .dataNotFound{
                self.customError = NetworkError.dataNotFound
            }else{
                self.customError = NetworkError.parsingError
            }
        }
        
    }
    
}
