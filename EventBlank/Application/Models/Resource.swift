//
//  Resource.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import UIKit

 public struct Resource: Codable {

    var uid: String
    var type: String
    var url: String?
    var local: String?
    
    var mediaType: ResourceType {
        return ResourceType.init(rawValue: type) ?? .none
    }
    
}

public enum ResourceType: String {
    case image
    case video
    case none
}
