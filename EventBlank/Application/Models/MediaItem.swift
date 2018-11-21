//
//  MediaItem.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import UIKit

 public struct MediaItem: Codable {

    var uid:String
    var type:String
    var url:String?
    var local:String?
    
    
    var mediaType:MediaItemType{
        return MediaItemType.init(rawValue: type) ?? .none
    }
    
}

public enum MediaItemType:String {
    case image
    case video
    case none
}
