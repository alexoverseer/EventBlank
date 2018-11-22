//
//  SpeakerRepository.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import Foundation

protocol SpeakerRepository: Repository {
    func getBy(group: [String]) -> [T]
}

class DefaultSpeakerRepository: NSObject, SpeakerRepository {
    
    func getBy(group: [String]) -> [Speaker] {
        let all = getAll()
        return all.filter { group.contains($0.uid)}
    }
    
    let appCache = ApplicationCache.inappCache
    
    func getAll() -> [Speaker] {
        return appCache.speakers
    }
    
    func getBy(uid: String) -> Speaker? {
        let all = getAll()
        return all.first(where: { $0.uid == uid })
    }
    
}
