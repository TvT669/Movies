//
//  MovieListScreen.swift
//  Movies
//
//  Created by 珠穆朗玛小蜜蜂 on 2025/4/3.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    
    @Query(sort: \Movie.title, order: .reverse) private var movies: [Movie]
    @State private var isAddMoviePresented: Bool = false
    
    var body: some View {
       
        MovieListView(movies: movies)
       .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Movie") {
                    isAddMoviePresented = true
                }
            }
        })
        .sheet(isPresented: $isAddMoviePresented, content: {
            NavigationStack{
                AddMovieScreen()
            }
        })
    }
}

#Preview {
    NavigationStack{
        MovieListScreen()
            .modelContainer(for: [Movie.self])
    }
}
