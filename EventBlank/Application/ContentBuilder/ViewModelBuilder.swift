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

    func buildTalkViewModel(uid: String) -> TalkViewModel? {
        guard let talk = talksRepository.getBy(uid: uid) else { return nil }
        guard let speaker = speakerRepository.getBy(uid: talk.speaker) else { return nil }
        let media = resourcesRepository.getBy(group: talk.media)
        let viewModel = TalkViewModel.init(talk: talk, speaker: speaker, resouces: media)
        return viewModel
    }

    func buildConferenceViewModel(uid: String) -> ConferenceViewModel? {
        guard let conference = conferenceRepository.getBy(uid: uid) else { return nil }
        let talks = talksRepository.getBy(conference: conference.uid)
        let peopleIds = talks.map { $0.speaker }
        let people = speakerRepository.getBy(group: peopleIds)
        let media = resourcesRepository.getBy(group: conference.images)
        let viewModel = ConferenceViewModel.init(conference: conference, resouces: media, people: people, topics: talks)
        return viewModel
    }

}
