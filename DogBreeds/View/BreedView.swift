//
//  BreedView.swift
//  DogBreed
//
//  Created by Jordan Isac on 06/07/2023.
//

import SwiftUI

struct BreedView: View {
    //MARK: - PROPERTIES
    @StateObject var viewModel: BreedViewModel
    
    //var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    @State private var searchText: String = ""
    
    var filteredBreed: [Breed] {
        if searchText == "" { return viewModel.breedArray}
        return viewModel.breedArray.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    //MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(filteredBreed) { breed in
                            NavigationLink{
                               BreedDetailView(breed:  Breed(id: 0, weight: Eight(imperial: "", metric: ""), height: Eight(imperial: "", metric: ""), name: breed.name, bredFor: "", breedGroup: BreedGroup.empty, lifeSpan: "", temperament: "", origin: "", referenceImageID: "", image: Images(id: "", width: 0, height: 0, url: breed.image.url), countryCode: CountryCode.us, description: "", history: ""))
                            } label: {

                                    VStack {
                                        ZStack(alignment: .bottom){
                                            RemoteImage(url: breed.image.url)
                                                .cornerRadius(20)
                                                .frame(width: 180)
                                                .scaledToFit()
                                               
                                            VStack(alignment: .leading) {
                                                Text(breed.name)
                                                    .font(.title2)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(Color.black)
                                            }
                                            .padding()
                                            .frame(width: 180, alignment: .leading)
                                            .background(.ultraThinMaterial)
                                            .cornerRadius(20)
                                        }
                                        .frame(width: 180, height: 250)
                                        .shadow(radius: 3)
                                       
                                        
                                    }
                            }
                        }
                    }
                    .task {
                        await viewModel.getBreedList(urlString: APIEndPoint.BreedListAPIEndPoint)
                    }
                }
                .padding()
            }
            .navigationTitle("Breeds")
            .searchable(text: $searchText)
            .background(Color.background2)
        }
        
    }
    
}

struct BreedView_Previews: PreviewProvider {
    static var previews: some View {
        BreedView(viewModel: BreedViewModel(repository: BreedRepositoryImplementation(networkManager: NetworkManager())))
    }
}




