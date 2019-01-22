//
//  ApplicationCache.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import UIKit

class ApplicationCache: NSObject {
    
    static let inappCache = ApplicationCache()
    
    public let conferences: [Conference]
    public let speakers: [Speaker]
    public let topics: [Topic]
    public let resources: [Resource]
    
    private let decoder = FileDecoder.default
    
    override init() {
        self.conferences = decoder.transformJSON(fileName: "conferences") ?? []
        self.speakers = decoder.transformJSON(fileName: "speakers") ?? []
        self.topics = decoder.transformJSON(fileName: "talks") ?? []
        self.resources = decoder.transformJSON(fileName: "resources") ?? []
    }
}
