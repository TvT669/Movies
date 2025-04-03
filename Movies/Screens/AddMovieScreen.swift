//
//  AddMovieScreen.swift
//  Movies
//
//  Created by 珠穆朗玛小蜜蜂 on 2025/4/3.
//

import SwiftUI
import SwiftData

struct AddMovieScreen: View {
    
    @Environment(\.dismiss) private var dismisss
    @Environment(\.modelContext) private var context
    
    @State private var title: String = ""
    @State private var year: Int?
    
    private var isFormValid: Bool {
        !title.isEmptyOrWhiteSpace && year != nil
    }
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year",value: $year,format: .number)
        }
        .navigationTitle("Add Movie")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismisss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save"){
                    
                    guard let year = year else { return }
                    
                    let movie = Movie(title: title, year: year)
                    context.insert(movie)
                    do{
                        try  context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    dismisss()
                }.disabled(!isFormValid)
            }
            
        }
        
    }
}

#Preview {
    NavigationStack{
        AddMovieScreen()
           .modelContainer(for: [Movie.self])
    }
   
}
