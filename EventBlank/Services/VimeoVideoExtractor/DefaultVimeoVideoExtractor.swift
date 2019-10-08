//
//  DefaultVimeoVideoExtractor.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/25/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation
import HCVimeoVideoExtractor

public final class DefaultVimeoVideoExtractor: NSObject, VimeoVideoExtractor {
    
    typealias VimeoHandler = (HCVimeoVideo?, Error?) -> Void
    
    private func extractVideo() -> (URL, @escaping VimeoHandler) -> Void {
        return HCVimeoVideoExtractor.fetchVideoURLFrom
    }
    
    public func fetchVideoURLFrom(path: String?, handler: @escaping Handler) {
        
        guard let validPath = path else {
            handler(.failure(VideoExtractorError.invalidPath))
            return
        }
        
        let videoURL = URL(string: validPath)
        
        guard let requestVideoURL = videoURL else {
            handler(.failure(VideoExtractorError.invalidURL))
            return
        }
        
        extractVideo()(requestVideoURL, { (video: HCVimeoVideo?, error: Error?) -> Void in
            
            if let extractorError = error {
                handler(.failure(VideoExtractorError.extractorError(extractorError)))
                return
            }
            
            guard let extractedVideo = video else {
                handler(.failure(VideoExtractorError.invalidVideoObject))
                return
            }
            
            let vimeoVideo = VimeoVideo(with: extractedVideo)
            handler(.success(vimeoVideo))
        })
    }
}
