//
//  ResourceRepository.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/23/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

public protocol ResourceRepository: Repository where Element == Resource {
    func getBy(group: [String]) -> [Resource]
}
