//
//  ViewModelBuilder.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import UIKit

class ViewModelBuilder: NSObject {

    static let `default` = ViewModelBuilder()

    let appCache = ApplicationCache.inappCache

    #warning ("Replace with dependency injection ")

    private let conferenceRepository = DefaultConferenceRepository()
    private let speakerRepository = DefaultSpeakerRepository()
    private let talksRepository = DefaultTalksRepository()
    private let resourcesRepository = DefaultResourceRepository()

    func buildConferenceViewModels() -> [ConferenceViewModel] {
        let conferences = conferenceRepository.getAll()
        let viewModels = conferences.flatMap { buildConferenceViewModel(uid: $0.uid) }
        return viewModels
    }
    
    func buildConferenceViewModel(uid: String) -> ConferenceViewModel? {
        guard let conference = conferenceRepository.getBy(uid: uid) else { return nil }
        let talks = talksRepository.getBy(conference: conference.uid).flatMap{ buildTalkViewModel(uid: $0.uid)}
        let peopleIds = talks.map { $0.speaker.uid }
        let people = speakerRepository.getBy(group: peopleIds).flatMap{ buildSpeakerViewModel(uid: $0.uid)}
        let media = resourcesRepository.getBy(group: conference.images)
        let viewModel = ConferenceViewModel.init(conference: conference, resouces: media, people: people, topics: talks)
        return viewModel
    }
    
    func buildTalkViewModel(uid: String) -> TalkViewModel? {
        guard let talk = talksRepository.getBy(uid: uid) else { return nil }
        guard let speaker = speakerRepository.getBy(uid: talk.speaker),
            let speakerViewModel = buildSpeakerViewModel(uid: speaker.uid)
            else { return nil }
        let media = resourcesRepository.getBy(group: talk.media)
        let viewModel = TalkViewModel(talk: talk, speaker: speakerViewModel, resouces: media)
        return viewModel
    }
    
    
    
    func buildSpeakerViewModel(uid: String) -> SpeakerViewModel? {
        guard let speaker = speakerRepository.getBy(uid: uid) else { return nil }
        let talks = talksRepository.getBy(speaker: speaker.uid).flatMap { buildTalkViewModel(uid: $0.uid) }
        let viewModel = SpeakerViewModel(speaker: speaker, topics: talks)
        return viewModel
    }


}


extension ViewModelBuilder{
    
    
    func buildAllConferenceViewModels() -> [ConferenceViewModel] {
        let conferences = conferenceRepository.getAll()
        let viewModels = conferences.flatMap { buildConferenceViewModel(conference: $0) }
        return viewModels
    }
    
    func buildConferenceViewModel(conference: Conference) -> ConferenceViewModel? {
        let talks = talksRepository.getBy(conference: conference.uid).flatMap{ buildTalkViewModel(talk: $0)}
        let peopleIds = talks.map { $0.speaker.uid }
        let people = speakerRepository.getBy(group: peopleIds).flatMap{ buildSpeakerViewModel(speaker: $0)}
        let media = resourcesRepository.getBy(group: conference.images)
        let viewModel = ConferenceViewModel(conference: conference, resouces: media, people: people, topics: talks)
        return viewModel
    }
    
        func buildTalkViewModel(talk: Topic) -> TalkViewModel? {
            guard let speaker = speakerRepository.getBy(uid: talk.speaker),
                let speakerViewModel = buildSpeakerViewModel(speaker: speaker)
                else { return nil }
            let media = resourcesRepository.getBy(group: talk.media)
            let viewModel = TalkViewModel.init(talk: talk, speaker: speakerViewModel, resouces: media)
            return viewModel
        }

        func buildSpeakerViewModel(speaker: Speaker) -> SpeakerViewModel? {
            let talks = talksRepository.getBy(speaker: speaker.uid).flatMap { buildTalkViewModel(talk: $0) }
            let viewModel = SpeakerViewModel(speaker: speaker, topics: talks)
            return viewModel
        }
}
