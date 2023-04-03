//
//  Module_5_ChallengeApp.swift
//  Module 5 Challenge
//
//  Created by Almat Alibekov on 03.04.2023.
//

import SwiftUI

@main
struct Module5Challenge: App {
    var body: some Scene {
        WindowGroup {
            VideoListView()
                .environmentObject(VideoModel())
        }
    }
}
