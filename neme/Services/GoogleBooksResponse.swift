//
//  GoogleBooksResponse.swift
//  neme
//
//  Created by surla on 9/17/26.
//

import Foundation

struct GoogleBooksResponse: Codable {
    let items: [BookVolume]?
}

struct BookVolume: Codable {
    let id: String
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Codable {
    let title: String
    let authors: [String]?
    let publishedDate: String?
    let imageLinks: [String: String]?
    let categories: [String]?
}

extension BookSearchResult {
    init(from volume: BookVolume) {
        self.id = volume.id
        self.title = volume.volumeInfo.title
        self.authors = volume.volumeInfo.authors ?? []
        self.coverURL = volume.volumeInfo.imageLinks?["thumbnail"]
        self.publicationYear = volume.volumeInfo.publishedDate
        self.categories = volume.volumeInfo.categories ?? []
    }
}
