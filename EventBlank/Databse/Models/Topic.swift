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
        media = try values.decode([String].self, forKey: .media)
        startDateTimeInterval = try values.decode(TimeInterval.self, forKey: .startDateTimeInterval)
        endDateTimeTimeInterval = try values.decode(TimeInterval.self, forKey: .endDateTimeTimeInterval)
        
        dateStart = formatDate(from: startDateTimeInterval)
        dateEnd = formatDate(from: endDateTimeTimeInterval)
    }
}

private func formatDate(from timeInterval: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: timeInterval)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "[ HH:mm ]"
    
    return dateFormatter.string(from: date)
}
