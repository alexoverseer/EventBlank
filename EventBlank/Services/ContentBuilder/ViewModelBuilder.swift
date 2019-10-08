//
//  ViewModelBuilder.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/24/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

public protocol ViewModelBuilder {
    func buildConferenceViewModels() -> [ConferenceViewVModel]
    func buildConferenceViewModel(conference: Conference) -> ConferenceViewVModel?
    
    func buildTalkViewModel(talk: Topic) -> TalkViewVModel?
    func buildTalksViewModel(for speaker: SpeakerViewVModel) -> [TalkViewVModel]
    
    func buildSpeakerViewModel(speaker: Speaker) -> SpeakerViewVModel?
}
