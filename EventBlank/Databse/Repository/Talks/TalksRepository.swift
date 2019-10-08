//
//  TalksRepository.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/23/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

public protocol TalksRepository: Repository where Element == Topic {
    func getBy(conference: String) -> [Topic]
    func getBy(speaker: String) -> [Topic]
}
