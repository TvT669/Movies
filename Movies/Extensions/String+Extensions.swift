//
//  String+Extensions.swift
//  Movies
//
//  Created by 珠穆朗玛小蜜蜂 on 2025/4/3.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool{
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
