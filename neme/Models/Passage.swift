//
//  Passage.swift
//  neme
//
//  Created by surla on 9/15/26.
//

import Foundation
import SwiftData

@Model
class Passage {
    var text: String
    var pageNumber: Int
    var book: Book
    
    var dateAdded: Date
    
    init(text: String, pageNumber: Int, book: Book, dateAdded: Date = Date.now) {
        self.text = text
        self.pageNumber = pageNumber
        self.dateAdded = dateAdded
        self.book = book
    }
}
