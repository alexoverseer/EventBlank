//
//  VimeoExtractor.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/25/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

public protocol VimeoVideoExtractor {
    typealias Handler = (Result<VimeoVideo, VideoExtractorError>) -> Void
    
    func fetchVideoURLFrom(path: String?, handler: @escaping Handler)
}
