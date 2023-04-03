//
//  VideoPlayerView.swift
//  Module 5 Challenge
//
//  Created by Almat Alibekov on 03.04.2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    @EnvironmentObject var video: VideoModel
    
    var videoTitle = ""
    var videoURL = ""
    
    var body: some View {
        
        let url = URL(string: videoURL)
        
        VStack {
            Text(videoTitle)
                .font(.title)
                .bold()
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .frame(height: 250)
            }
            Spacer()
        }
        
       
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
