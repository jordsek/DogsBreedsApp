//
//  VideoView.swift
//  DogBreed
//
//  Created by Jordan Isac on 06/07/2023.
//

import SwiftUI
import _AVKit_SwiftUI

struct VideoView: View {
    //MARK: - PROPERTIES
    
    var videos: [Video] = Bundle.main.decode("videos.json")
    
    //MARK: - BODY
    var body: some View {
        
        NavigationView {
            List { 
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 5)
                    }
                }//LOOP
            }//LIST
            .listStyle(InsetListStyle())
            .navigationBarTitle("Dog Videos", displayMode: .inline)
        }//: NAVIGATION
        
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
        
    }
}
