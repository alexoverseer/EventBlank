//
//  TalkViewModel.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import UIKit

struct TalkViewModel {
    let talk: Topic
    let speaker: SpeakerViewModel
    let resouces: [Resource]
    
    var video:Resource?{
        return resouces.first(where: {$0.mediaType == .video })
    }
    
    var images:[Resource]{
       return resouces.filter{$0.mediaType == .image }
    }
}
