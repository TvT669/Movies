//
//  MovieDetailScreen.swift
//  Movies
//
//  Created by 珠穆朗玛小蜜蜂 on 2025/4/3.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    @Environment(\.modelContext) private var context
    let movie: Movie
    
    @State private var title: String = ""
    @State private var year: Int?
    
    var body: some View {
        Form{
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
            Button("Update") {
                guard let year = year else {return}
                
                movie.title = title
                movie.year = year
                
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
            }.buttonStyle(.borderless)
        }.onAppear {
            title = movie.title
            year = movie.year
        }
    }
}

struct MovieDetailScreenContainerScreen: View {
    
    @Environment(\.modelContext) private var context
    @State private var movie: Movie?
    
    var body: some View {
        ZStack {
            if let movie {
                MovieDetailScreen(movie: movie)
            }
        }
            .onAppear{
                movie = Movie(title: "Spiderman", year: 2023)
                context.insert(movie!)
            }
    }
}

#Preview {
    MovieDetailScreenContainerScreen()
        .modelContainer(for: [Movie.self])
}
