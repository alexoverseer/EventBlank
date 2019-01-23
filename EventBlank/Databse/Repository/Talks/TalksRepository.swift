//
//  TalksRepository.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/23/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

protocol TalksRepository: Repository {
    func getBy(conference: String) -> [Topic]
    func getBy(speaker: String) -> [Topic]
}
