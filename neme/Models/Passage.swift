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
    var notes: [Note]
    
    init(text: String, pageNumber: Int, book: Book, dateAdded: Date = .now, notes: [Note] = []) {
        self.text = text
        self.pageNumber = pageNumber
        self.book = book
        self.dateAdded = dateAdded
        self.notes = notes
    }
}
