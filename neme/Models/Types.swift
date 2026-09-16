//
//  Types.swift
//  neme
//
//  Created by surla on 9/14/26.
//

import Foundation

enum ReadingStatus: String, Codable {
    case reading
    case finished
}

enum Emotion: String, Codable {
    case joyful
    case sad
    case angry
    case surprised
    case amazed
    case hopeful
    case reflective
    case neutral
}
