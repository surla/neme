//
//  nemeApp.swift
//  neme
//
//  Created by surla on 9/14/26.
//

import SwiftData
import SwiftUI

@main
struct nemeApp: App {
    var body: some Scene {
        WindowGroup {
            AddBookSearchView()
        }
        .modelContainer(for: [Book.self, Passage.self, Note.self, Tag.self])
    }
}
