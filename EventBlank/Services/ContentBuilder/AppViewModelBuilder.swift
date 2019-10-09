//
//  ViewModelBuilder.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import Foundation

public final class AppViewModelBuilder: NSObject {
    
    public let conferenceRepository: AnyRepository<Conference>
    public let talksRepository: AnyRepository<Topic>
    public let resourceRepository: AnyRepository<Resource>
    public let speakerRepository: AnyRepository<Speaker>
    
    public init(_ conferenceCache: AnyRepository<Conference> =           AnyRepository(InCacheConferenceRepository()),
                _ talksCache: AnyRepository<Topic> = AnyRepository(InCacheTalksRepository()),
                _ resourceCache: AnyRepository<Resource> = AnyRepository(InCacheResourceRepository()),
                _ speakerCache: AnyRepository<Speaker> = AnyRepository(InCacheSpeakersRepository())) {
        
        self.conferenceRepository = conferenceCache
        self.talksRepository = talksCache
        self.resourceRepository = resourceCache
        self.speakerRepository = speakerCache
    }

}

extension AppViewModelBuilder: ViewModelBuilder {
    
    public func buildConferenceViewModels() -> [ConferenceViewVModel] {
        let conferences = conferenceRepository.getAll()
        let viewModels = conferences.compactMap { buildConferenceViewModel(conference: $0) }
        
        return viewModels
    }
    
    public func buildConferenceViewModel(conference: Conference) -> ConferenceViewVModel? {
        let talks = talksRepository.getBy(conference: conference.uid).compactMap { buildTalkViewModel(talk: $0)}
        let peopleIds = talks.map { $0.speaker.uid }
        let people = speakerRepository.getBy(group: peopleIds).compactMap { buildSpeakerViewModel(speaker: $0)}
        let media = resourceRepository.getBy(group: conference.images)
        let viewModel = ConferenceViewVModel(conference: conference,
                                             resources: media,
                                             people: people,
                                             topics: talks)
        
        return viewModel
    }
    
    public func buildTalkViewModel(talk: Topic) -> TalkViewVModel? {
        guard let speaker = speakerRepository.getBy(uid: talk.speaker),
            var speakerViewModel = buildSpeakerViewModel(speaker: speaker)
            else { return nil }
        let media = resourceRepository.getBy(group: talk.media)
        
        speakerViewModel.topics = buildTalksViewModel(for: speakerViewModel)
        let viewModel = TalkViewVModel(talk: talk,
                                       speaker: speakerViewModel,
                                       resouces: media)
        
        return viewModel
    }
    public func buildTalksViewModel(for speaker: SpeakerViewVModel) -> [TalkViewVModel] {
        let talks = talksRepository.getBy(speaker: speaker.uid)
        
        let viewModel = talks.compactMap { TalkViewVModel(talk: $0,
                                                          speaker: speaker,
                                                          resouces: resourceRepository.getBy(group: $0.media))}
        
        return viewModel
    }
    
    public func buildSpeakerViewModel(speaker: Speaker) -> SpeakerViewVModel? {
        let viewModel = SpeakerViewVModel(speaker: speaker)
        
        return viewModel
    }
}
