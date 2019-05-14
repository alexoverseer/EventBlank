//
//  VideoQuality.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/29/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

public enum VideoQuality: Int {
    
    case quality1080
    case quality960
    case quality720
    case quality640
    case quality540
    case quality360
    case qualityUnknown
    
    static func current(rawValue: Int) -> VideoQuality {
        return VideoQuality(rawValue: rawValue) ?? .quality360
    }
}
