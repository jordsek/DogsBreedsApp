//
//  MainView.swift
//  DogBreed
//
//  Created by Jordan Isac on 06/07/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
          HomeView()
            .tabItem({
              Image("L1")
                    
              Text("Home")
            })
            BreedView(viewModel: BreedViewModel(repository: BreedRepositoryImplementation(networkManager: NetworkManager())))
            .tabItem({
              Image("L3")
              Text("Breeds")
            })
            VideoView()
            .tabItem({
                Image("L2")
              Text("Videos")
            })
          InfoView()
            .tabItem({
              Image("L4")
              Text("Information")
            })
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color.text)
       
       
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
