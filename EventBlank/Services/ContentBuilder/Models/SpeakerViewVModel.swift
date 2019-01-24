//
//  SpeakerViewModel.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import Foundation

struct SpeakerViewVModel {
    var uid: String
    var name: String
    var title: String
    var photo: String
    var page: URL?
    
    var topics: [TalkViewModel] = []
    
    init(speaker: Speaker) {
        self.uid = speaker.uid
        self.name = speaker.name
        self.title = speaker.title
        self.photo = speaker.photo
        self.page = speaker.page
    }
}
