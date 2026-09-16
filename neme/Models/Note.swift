//
//  Note.swift
//  neme
//
//  Created by surla on 9/15/26.
//

import Foundation
import SwiftData

@Model
class Note {
    var text: String
    var book: Book
    var dateAdded: Date
    
    @Relationship(deleteRule: .nullify)
    var passage: Passage?
    
    init(text: String, book: Book, dateAdded: Date = .now, passage: Passage? = nil) {
        self.text = text
        self.book = book
        self.dateAdded = dateAdded
        self.passage = passage
    }
}
