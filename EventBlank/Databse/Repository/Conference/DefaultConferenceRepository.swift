//
//  ConferenceRepository.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import UIKit

public class DefaultConferenceRepository: NSObject, ConferenceRepository {
    
    let appCache = ApplicationCache.inappCache
    
    public func getAll() -> [Conference] {
        return appCache.conferences
    }
    
    public func getBy(uid: String) -> Conference? {
        let all = getAll()
        return all.first(where: { $0.uid == uid })
    }
}
