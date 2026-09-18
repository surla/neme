//
//  BookSearchService.swift
//  neme
//
//  Created by surla on 9/17/26.
//

import Foundation

struct BookSearchResult: Identifiable {
    let id: String
    let title: String
    let authors: [String]
    let coverURL: String?
    let publicationYear: String?
}

struct BookSearchService {
    func search(query: String) async throws -> [BookSearchResult] {
        return []
    }
}
