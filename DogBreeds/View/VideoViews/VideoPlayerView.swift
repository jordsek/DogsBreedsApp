//
//  VideoPlayerView.swift
//  DogBreed
//
//  Created by Jordan Isac on 19/07/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - PROPERTIES
    
     var videoSelected: String
     var videoTitle: String
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
              VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4"))
            }
        }
        //.accentColor(.accentColor)
        //.navigationTitle(videoTitle, displayMode: .inline)
        
    }

// MARK: - PREVIEW

struct VideoPlayerView_Previews: PreviewProvider {
  static var previews: some View {
      NavigationView{
          VideoPlayerView(videoSelected: "v1", videoTitle: "V1")
      }
    }
  }
