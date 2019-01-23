//
//  Conference.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import Foundation

struct Conference: Codable {

    var uid: String
    var title: String
    var description: String?
    var images: [String] // ids for MediaItem object [1,2,3,4,5]
}
