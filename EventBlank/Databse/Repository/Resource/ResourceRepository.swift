//
//  ResourceRepository.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/23/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

protocol ResourceRepository: Repository {
    func getBy(group: [String]) -> [Resource]
}
