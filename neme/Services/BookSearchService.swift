//
//  BookSearchService.swift
//  neme
//
//  Created by surla on 9/17/26.
//

import Foundation

enum BookSearchError: Error {
    case missingAPIKey
    case invalidURL
}

struct BookSearchResult: Identifiable {
    let id: String
    let title: String
    let authors: [String]
    let coverURL: String?
    let publicationYear: String?
}

struct BookSearchService {
    func search(query: String) async throws -> [BookSearchResult] {
        guard let apiKey = Secrets.googleBooksAPIKey else {
            throw BookSearchError.missingAPIKey
        }
        
        var components = URLComponents(string: "https://www.googleapis.com/books/v1/volumes")
        components?.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        guard let url = components?.url else {
            throw BookSearchError.invalidURL
        }
        return []
    }
}
