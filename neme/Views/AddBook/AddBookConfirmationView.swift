//
//  AddBookConfirmationView.swift
//  neme
//
//  Created by surla on 9/22/26.
//

import SwiftUI

struct AddBookConfirmationView: View {
    let result: BookSearchResult
    
    var body: some View {
        VStack(spacing: 16) {
            let secureURLString = result.coverURL?.replacingOccurrences(of: "http://", with: "https://")
            AsyncImage(url: URL(string: secureURLString ?? "")) { image in
                image.resizable().aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "book.closed")
            }
            .frame(width: 120, height: 170)
            
            Text(result.title)
                .font(.title3)
                .fontWeight(.semibold)
            Text(result.authors.joined(separator: ", "))
                .foregroundStyle(.secondary)
            
            Button("Add this book") {
                
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    AddBookConfirmationView(result: BookSearchResult(
        id: "1",
        title: "The Wind-Up Bird Chronicle",
        authors: ["Haruki Murakami"],
        coverURL: nil,
        publicationYear: "1994"
    ))
}
