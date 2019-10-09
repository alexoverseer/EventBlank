//
//  SpeakerRepository.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/23/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

public protocol SpeakerRepository: Repository where Element == Speaker {
    func getBy(group: [String]) -> [Speaker]
}

public class InCacheSpeakersRepository: Repository {
    
    public init() {}
    
    let appCache = ApplicationCache.inappCache
    
    public func getAll() -> [Speaker] {
        return appCache.speakers
    }
    
    public func getBy(uid: String) -> Speaker? {
        let all = getAll()
        return all.first(where: { $0.uid == uid })
    }
}

extension AnyRepository: SpeakerRepository where T == Speaker {
    
    public func getBy(group: [String]) -> [Speaker] {
        let all = getAll()
        return all.filter { group.contains($0.uid) }
    }
}
