//
//  InCacheTalksRepository.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/23/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

public protocol TalksRepository {
    func getBy(conference: String) -> [Topic]
    func getBy(speaker: String) -> [Topic]
}

public class InCacheTalksRepository: Repository {
    
    public init() {}
 
    let appCache = ApplicationCache.inappCache

    public func getAll() -> [Topic] {
        return appCache.topics
    }
    
    public func getBy(uid: String) -> Topic? {
        let all = getAll()
        return all.first(where: { $0.uid == uid })
    }

}

extension AnyRepository: TalksRepository where T == Topic {
    
    public func getBy(conference: String) -> [Topic] {
        let all = getAll()
        return all.filter { $0.conference == conference }
    }
    
    public func getBy(speaker: String) -> [Topic] {
        let all = getAll()
        return all.filter { $0.speaker == speaker }
    }

}
