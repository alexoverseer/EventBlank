//
//  ResourceRepository.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/23/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

public protocol ResourceRepository {
    func getBy(group: [String]) -> [Resource]
}
public class InCacheResourceRepository: Repository {
    
    public init() {}
    
    let appCache = ApplicationCache.inappCache
    
    public func getAll() -> [Resource] {
        return appCache.resources
    }
    
    public func getBy(uid: String) -> Resource? {
        let all = getAll()
        return all.first(where: { $0.uid == uid })
    }
}

extension AnyRepository: ResourceRepository where T == Resource {
    
    public func getBy(group: [String]) -> [Resource] {
        let all = getAll()
        return all.filter { group.contains($0.uid) }
    }
 
}
