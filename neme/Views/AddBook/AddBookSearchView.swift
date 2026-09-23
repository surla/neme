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
                        HStack(spacing: 12) {
                            let secureURLString = result.coverURL?.replacingOccurrences(of: "http://", with: "https://")
                            AsyncImage(url: URL(string: secureURLString ?? "")) { image in
                                image.resizable().aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Image(systemName: "book.closed")
                                    .foregroundStyle(.secondary)
                            }
                            .onAppear { print("Cover URL: \(result.coverURL ?? "nil")") }
                            .frame(width: 44, height: 62)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text(result.title)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text(result.authors.joined(separator: ", "))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
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
