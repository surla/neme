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
    case invalidHTTPResponse
    case badStatusCode
}

struct BookSearchResult: Identifiable, Hashable {
    let id: String
    let title: String
    let authors: [String]
    let coverURL: String?
    let publicationYear: String?
    let categories: [String]
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
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw BookSearchError.invalidHTTPResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw BookSearchError.badStatusCode
        }
        
        let decodedResponse = try JSONDecoder().decode(GoogleBooksResponse.self, from: data)
        
        let results = decodedResponse.items?.map { volume in
            BookSearchResult(from: volume)
        }
        return results ?? []
    }
}
