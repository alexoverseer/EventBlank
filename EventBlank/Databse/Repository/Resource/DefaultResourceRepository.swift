//
//  ResourceRepository.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import Foundation

public class DefaultResourceRepository: NSObject, ResourceRepository {
    
    let appCache = ApplicationCache.inappCache
    
    public func getAll() -> [Resource] {
        return appCache.resources
    }
    
    public func getBy(uid: String) -> Resource? {
        let all = getAll()
        return all.first(where: { $0.uid == uid })
    }
    
    public func getBy(group: [String]) -> [Resource] {
        let all = getAll()
        return all.filter { group.contains($0.uid) }
    }
}
