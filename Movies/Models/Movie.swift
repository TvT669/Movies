//
//  Movie.swift
//  Movies
//
//  Created by 珠穆朗玛小蜜蜂 on 2025/4/3.
//

import Foundation
import SwiftData

@Model
final class Movie {
    var title: String
    var year: Int
    
    init(title: String, year:Int) {
        self.title = title
        self.year = year

    }
}

extension Movie : PersistentModel {}

extension Movie : Observable { }
