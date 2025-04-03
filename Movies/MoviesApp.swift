//
//  MoviesApp.swift
//  Movies
//
//  Created by 珠穆朗玛小蜜蜂 on 2025/4/3.
//

import SwiftUI

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                MovieListScreen()
            }
        }.modelContainer(for: [Movie.self])
        
    }
}
