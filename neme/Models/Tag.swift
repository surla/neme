//
//  Tag.swift
//  neme
//
//  Created by surla on 9/15/26.
//

import Foundation
import SwiftData

@Model
class Tag {
    var name: String
    var books: [Book] = []
    
    init(name: String, books: [Book] = []) {
        self.name = name
        self.books = books
    }
}
