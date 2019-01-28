//
//  VimeoVideo.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/28/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation
import HCVimeoVideoExtractor

struct VimeoVideo {
    let title: String
    let videoURL: URL?
    let thumbnail: URL?
    
    init(with hcVimeoVideo: HCVimeoVideo) {
        self.title = hcVimeoVideo.title
        self.videoURL = hcVimeoVideo.videoURL[.Quality1080p]
        self.thumbnail = hcVimeoVideo.thumbnailURL[.QualityBase]
    }
}
