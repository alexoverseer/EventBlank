//
//  VideoExtractorError.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/28/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

enum VideoExtractorError: Error {
    case invalidPath
    case invalidURL
    case extractorError(Error)
    case invalidVideoObject
    
    var message: String {
        switch self {
        case .invalidPath:
            return "Invalid video path"
        case .invalidURL:
            return "Invalid video URL"
        case .extractorError(let error):
            return error.localizedDescription
        case .invalidVideoObject:
            return "Invalid video object"
        }
    }
}
