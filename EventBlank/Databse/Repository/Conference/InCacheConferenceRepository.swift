//
//  ConferenceRepository.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/23/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

public class InCacheConferenceRepository: Repository {
 
    public init() {}
    
    let appCache = ApplicationCache.inappCache
    
    public func getAll() -> [Conference] {
        return appCache.conferences
    }
    
    public func getBy(uid: String) -> Conference? {
        let all = getAll()
        return all.first(where: { $0.uid == uid })
    }
}
