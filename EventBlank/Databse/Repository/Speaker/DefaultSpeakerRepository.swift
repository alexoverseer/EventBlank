//
//  SpeakerRepository.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import Foundation

public class DefaultSpeakerRepository: NSObject, SpeakerRepository {
    
    let appCache = ApplicationCache.inappCache
    
    public func getBy(group: [String]) -> [Speaker] {
        let all = getAll()
        return all.filter { group.contains($0.uid) }
    }
    
    public func getAll() -> [Speaker] {
        return appCache.speakers
    }
    
    public func getBy(uid: String) -> Speaker? {
        let all = getAll()
        return all.first(where: { $0.uid == uid })
    }
}
