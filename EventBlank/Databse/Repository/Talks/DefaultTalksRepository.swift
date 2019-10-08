//
//  TalksRepository.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import Foundation

public class DefaultTalksRepository: NSObject, TalksRepository {
    
    let appCache = ApplicationCache.inappCache
    
    public func getBy(conference: String) -> [Topic] {
        let all = getAll()
        return all.filter { $0.conference == conference }
    }
    
    public func getAll() -> [Topic] {
        return appCache.topics
    }
    
    public func getBy(uid: String) -> Topic? {
        let all = getAll()
        return all.first(where: { $0.uid == uid })
    }
    
    public func getBy(speaker: String) -> [Topic] {
        let all = getAll()
        return all.filter { $0.speaker == speaker }
    }
}
