//
//  Topic.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import Foundation

struct Topic: Codable {
    var uid: String
    var conference: String?
    var title: String?
    var speaker: String
    var description: String?
    var media: [String] // ids for MediaItem object
    
    var dateStart: String
    var dateEnd: String
    
    private var startDateTimeInterval: TimeInterval
    private var endDateTimeTimeInterval: TimeInterval
    
    enum CodingKeys: String, CodingKey {
        case uid
        case conference
        case title
        case speaker
        case description
        case media
        case dateStart
        case dateEnd
        
        case startDateTimeInterval = "startDate"
        case endDateTimeTimeInterval = "endDate"
    }
}

extension Topic {
    
    init(from decoder: Swift.Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        uid = try values.decode(String.self, forKey: .uid)
        conference = try values.decode(String?.self, forKey: .conference)
        title = try values.decode(String?.self, forKey: .title)
        speaker = try values.decode(String.self, forKey: .speaker)
        description = try values.decode(String?.self, forKey: .description)
        media = try values.decode([String].self, forKey: .media)
        
        startDateTimeInterval = try values.decode(TimeInterval.self, forKey: .startDateTimeInterval)
        endDateTimeTimeInterval = try values.decode(TimeInterval.self, forKey: .endDateTimeTimeInterval)
        
        dateStart = ""
        dateEnd = ""
    }
}
