//
//  ViewModelBuilder.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/24/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

protocol ViewModelBuilder {
    func buildConferenceViewModels() -> [ConferenceViewVModel]
    func buildConferenceViewModel(conference: Conference) -> ConferenceViewVModel?
    
    func buildTalkViewModel(talk: Topic) -> TalkViewModel?
    func buildTalksViewModel(for speaker: SpeakerViewVModel) -> [TalkViewModel]
    
    func buildSpeakerViewModel(speaker: Speaker) -> SpeakerViewVModel?
}
