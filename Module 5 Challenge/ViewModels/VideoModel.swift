//
//  VideoModel.swift
//  Module 5 Challenge
//
//  Created by Almat Alibekov on 03.04.2023.
//

import Foundation

class VideoModel: ObservableObject {
    
    @Published var videos = [Video]()
    
    init() {
        
        getRemoteData()
        
    }
    
    func getRemoteData() {
        
        // String path
        let urlString = "https://codewithchris.github.io/Module5Challenge/Data.json"
        
        // Create a url object
        let url = URL(string: urlString)
        
        guard url != nil else {
            
            // Couldn't create url
            return
            
        }
        
        // Create URLrequest object
        let request = URLRequest(url: url!)
        
        // Get the session and kick off the task
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            // Check if there is an error
            guard error == nil else {
                 // There was an error
                return
            }
            do {
                
                // Create JSON decoder
                let decoder = JSONDecoder()
                
                // Decode
                let videos = try decoder.decode([Video].self, from: data!)
                
                DispatchQueue.main.async {
                    self.videos += videos
                }
                
                
                
            }
            catch {
                
                print(error)
                
            }
            
        }
        dataTask.resume()
        
    }
    
}
