//
//  Book.swift
//  neme
//
//  Created by surla on 9/15/26.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var coverURL: String?
    var status: ReadingStatus
    var startDate: Date
    var finishedDate: Date?
    var rating: Int?
    var emotions:  [Emotion]
    var tags: [Tag]
    
    @Relationship(deleteRule: .cascade)
    var passages: [Passage]
    
    @Relationship(deleteRule: .cascade)
    var notes: [Note]
    
    init(title: String, author: String, coverURL: String? = nil, status: ReadingStatus = .reading, startDate: Date = .now, finishedDate: Date? = nil, rating: Int? = nil, emotions: [Emotion] = [], passages: [Passage] = [], notes: [Note] = [], tags: [Tag] = []) {
        self.title = title
        self.author = author
        self.coverURL = coverURL
        self.status = status
        self.startDate = startDate
        self.finishedDate = finishedDate
        self.rating = rating
        self.emotions = emotions
        self.passages = passages
        self.notes = notes
        self.tags = tags
    }
}
