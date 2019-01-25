//
//  SpeakerRepository.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/23/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

protocol SpeakerRepository: Repository {
    func getBy(group: [String]) -> [Element]
}
