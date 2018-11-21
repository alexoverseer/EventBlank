//
//  Topic.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import Foundation

struct Topic: Codable {
    var uid:String
    var title: String
    var speaker:String
    var description: String
    var media: [String] // ids for MediaItem object 
    var startDate: Int
    var endDate: Int
}
