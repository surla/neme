//
//  AddBookSearchView.swift
//  neme
//
//  Created by surla on 9/20/26.
//

import SwiftUI

struct AddBookSearchView: View {
    @State private var query = ""
    @State private var results: [BookSearchResult] = []
    @State private var isSearching = false
    @State private var errorMessage: String? = nil
    
    private func performSearch() async {
        isSearching = true
        errorMessage = nil
        
        do {
            let service = BookSearchService()
            results = try await service.search(query:  query)
        } catch let error as URLError where error.code == .cancelled {
            // ignore
        } catch {
            print("Search failed: \(error)")
            errorMessage = "Something went wrong. Please try again"
        }
        
        isSearching = false
    }
        
    var body: some View {
        NavigationStack {
            Group {
                if isSearching {
                    ProgressView("Searching...")
                } else if let errorMessage {
                    ContentUnavailableView(errorMessage, systemImage: "exclamationmark.triangle")
                } else if query.isEmpty {
                    ContentUnavailableView("Search for a book", systemImage: "magnifyingglass")
                } else if results.isEmpty {
                    ContentUnavailableView("No books found", systemImage: "book.closed")
                } else {
                    List(results) { result in
                        Text(result.title)
                    }
                }
            }
            .searchable(text: $query, prompt: "Search title, author, ISBN")
            .task(id: query) {
                do {
                    try await Task.sleep(for: .milliseconds(500))
                } catch {
                    return
                }
                
                guard !query.isEmpty else {
                    results = []
                    return
                }
                
                await performSearch()
            }
            .onSubmit(of: .search) {
                Task {
                    await performSearch()
                }
            }
        }
    }
}

#Preview {
    AddBookSearchView()
}
