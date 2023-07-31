//
//  BreedDetailView.swift
//  DogBreed
//
//  Created by Jordan Isac on 10/07/2023.
//

import SwiftUI

struct BreedDetailView: View {
    //MARK: - PROPERTIES
    var breed: Breed

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            RemoteImage(url: breed.image.url)
                .scaledToFit()
                .cornerRadius(12)
                .shadow(color: Color.black ,radius: 1, x: 0, y: 0)
        
            Spacer()


            VStack(alignment: .leading, spacing: 12){
                //NAME
                Text(breed.name)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color.background)
                    .lineLimit(1)

                //DESCRIPTION
                Text(breed.description!)
                    .fontWeight(.bold)
                    .foregroundColor(Color.icon)
                    
            }
            .padding()
            .padding(.bottom, 12)
        }
        .background(Color.background2)
        .cornerRadius(12)
        .shadow(color: Color.gray, radius: 8, x: 0, y: 0)

    }
}


struct BreedDetailView_Previews: PreviewProvider {
     
    static var previews: some View {
        BreedDetailView(breed: Breed(id: 1, weight: Eight( imperial:"6 - 13",metric:"3 - 6"), height: Eight( imperial:"9 - 11.5",metric:"23 - 29"), name :"Affenpinscher", bredFor :"Small rodent hunting, lapdog", breedGroup :BreedGroup.empty, lifeSpan :"10 - 12 years", temperament :"Stubborn, Curious, Playful, Adventurous, Active, Fun-loving", origin :"Germany, France", referenceImageID:"BJa4kxc4X",image:Images(id:"BJa4kxc4X", width :1600, height :1199, url :"https://cdn2.thedogapi.com/images/BJa4kxc4X.jpg"),countryCode: CountryCode.us, description: "The Alapaha Blue Blood Bulldog is a well-developed, exaggerated bulldog with a broad head and natural drop ears. The prominent muzzle is covered by loose upper lips", history: ""))
        }
}


