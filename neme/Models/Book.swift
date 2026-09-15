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
    
    init(title: String, author: String, coverURL: String? = nil, status: ReadingStatus = .reading, startDate: Date = Date.now, finishedDate: Date? = nil, rating: Int? = nil, emotions: [Emotion] = []) {
        self.title = title
        self.author = author
        self.coverURL = coverURL
        self.status = status
        self.startDate = startDate
        self.finishedDate = finishedDate
        self.rating = rating
        self.emotions = emotions
    }
}
