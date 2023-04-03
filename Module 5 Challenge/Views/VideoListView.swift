//
//  ContentView.swift
//  Module 5 Challenge
//
//  Created by Almat Alibekov on 03.04.2023.
//

import SwiftUI

struct VideoListView: View {
    
    @EnvironmentObject var video: VideoModel
    @State private var searchText = ""
    
    
    var searchResults: [Video] {
        
        if searchText.isEmpty {
            
            return video.videos
            
        } else {
            
            return video.videos.filter { $0.title.localizedCaseInsensitiveContains(searchText)}
        }
        
    }
    
    var body: some View {
        
        NavigationStack {
            
            List(searchResults) { video in
                
                NavigationLink {
                    VideoPlayerView(videoTitle: video.title, videoURL: video.url)
                } label: {
                    Text(video.title)
                }
                
            }
            .navigationTitle("All Videos")
        }
        .searchable(text: $searchText, prompt: "Look for a specific video" )
        
        
        
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
            .environmentObject(VideoModel())
    }
}

