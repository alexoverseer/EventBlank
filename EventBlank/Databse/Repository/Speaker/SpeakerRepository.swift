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
