//
//  VideoListItem.swift
//  DogBreed
//
//  Created by Jordan Isac on 07/07/2023.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: - PROPERTIES
    let video: Video
    
    //MARK: - BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                //Image("")
                
                    Image(video.thumnail)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(9)
                        .frame(width: 150, height: 80)
                        
                    
                    Image(systemName: "play.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 32)
                        .shadow(radius: 4)
                
            }//:Zstack
            
            VStack(alignment: .leading, spacing: 10){
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.background)
                    
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .foregroundColor(Color.text)
                
            }
        }//:HSTACK
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItemView(video: videos[0])
    }
}
