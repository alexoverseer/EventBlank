//
//  ConferenceViewModel.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import UIKit

struct ConferenceViewVModel {
    let conference: Conference
    let resources: [Resource]
    let people: [SpeakerViewVModel]
    let topics: [TalkViewVModel]
}
