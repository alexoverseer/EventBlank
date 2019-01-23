//
//  TalksRepository.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import Foundation

class DefaultTalksRepository: NSObject, TalksRepository {
    let appCache = ApplicationCache.inappCache
    
    func getBy(conference: String) -> [Topic] {
        let all = getAll()
        return all.filter {$0.conference == conference }
    }
    
    func getAll() -> [Topic] {
        return appCache.topics
    }
    
    func getBy(uid: String) -> Topic? {
        let all = getAll()
        return all.first(where: { $0.uid == uid })
    }
    
    func getBy(speaker: String) -> [Topic] {
        let all = getAll()
        return all.filter { $0.speaker == speaker }
    }
}
