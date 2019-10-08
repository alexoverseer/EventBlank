//
//  VimeoVideo.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/28/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation
import HCVimeoVideoExtractor

public struct VimeoVideo {
    let title: String
    let thumbnail: URL?
    var selectedQuality: String?
    private let videoQualities: [HCVimeoVideoQuality: URL]?
    
    var qualities: [String]? {
        return videoQualities?.keys.map { $0.rawValue }
    }
    
    init(with hcVimeoVideo: HCVimeoVideo) {
        self.title = hcVimeoVideo.title
        self.videoQualities = hcVimeoVideo.videoURL
        self.thumbnail = hcVimeoVideo.thumbnailURL[.QualityBase]
        self.selectedQuality = hcVimeoVideo.videoURL.keys.first?.rawValue
    }
    
    func getVideoURL(for selectedQuality: String) -> URL? {
        let selectedQuality = HCVimeoVideoQuality.current(rawValue: selectedQuality)
        return self.videoQualities?[selectedQuality]
    }
    
    mutating func changeQuality(to quality: String?) {
        self.selectedQuality = quality
    }
}

private extension HCVimeoVideoQuality {
    
    static func current(rawValue: String) -> HCVimeoVideoQuality {
        return HCVimeoVideoQuality(rawValue: rawValue) ?? .Quality360p
    }
}
