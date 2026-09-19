//
//  Secrets.swift
//  neme
//
//  Created by surla on 9/18/26.
//

import Foundation

enum Secrets {
    static var googleBooksAPIKey: String? {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "GoogleBooksAPIKey") as? String else {
            assertionFailure("Missing GoogleBooksAPIKey in Info.plist")
            return nil
        }
        return key
    }
}
