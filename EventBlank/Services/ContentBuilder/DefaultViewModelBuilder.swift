//
//  ViewModelBuilder.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import UIKit

final class DefaultViewModelBuilder {
    private let conferenceRepository = DefaultConferenceRepository()
    private let speakerRepository = DefaultSpeakerRepository()
    private let talksRepository = DefaultTalksRepository()
    private let resourcesRepository = DefaultResourceRepository()
}

extension DefaultViewModelBuilder: ViewModelBuilder {
    
    func buildConferenceViewModels() -> [ConferenceViewVModel] {
        let conferences = conferenceRepository.getAll()
        let viewModels = conferences.compactMap { buildConferenceViewModel(conference: $0) }
        
        return viewModels
    }
    
    func buildConferenceViewModel(conference: Conference) -> ConferenceViewVModel? {
        let talks = talksRepository.getBy(conference: conference.uid).compactMap { buildTalkViewModel(talk: $0)}
        let peopleIds = talks.map { $0.speaker.uid }
        let people = speakerRepository.getBy(group: peopleIds).compactMap { buildSpeakerViewModel(speaker: $0)}
        let media = resourcesRepository.getBy(group: conference.images)
        let viewModel = ConferenceViewVModel(conference: conference,
                                             resources: media,
                                             people: people,
                                             topics: talks)
        
        return viewModel
    }
    
    func buildTalkViewModel(talk: Topic) -> TalkViewVModel? {
        guard let speaker = speakerRepository.getBy(uid: talk.speaker),
            var speakerViewModel = buildSpeakerViewModel(speaker: speaker)
            else { return nil }
        let media = resourcesRepository.getBy(group: talk.media)
        
        speakerViewModel.topics = buildTalksViewModel(for: speakerViewModel)
        let viewModel = TalkViewVModel(talk: talk,
                                       speaker: speakerViewModel,
                                       resouces: media)
        
        return viewModel
    }
    
    func buildTalksViewModel(for speaker: SpeakerViewVModel) -> [TalkViewVModel] {
        let talks = talksRepository.getBy(speaker: speaker.uid)
        
        let viewModel = talks.compactMap { TalkViewVModel(talk: $0,
                                                          speaker: speaker,
                                                          resouces: resourcesRepository.getBy(group: $0.media))}
        
        return viewModel
    }
    
    func buildSpeakerViewModel(speaker: Speaker) -> SpeakerViewVModel? {
        let viewModel = SpeakerViewVModel(speaker: speaker)
        
        return viewModel
    }
}
