//
//  Environment.swift
//  EventBlank
//
//  Created by Ilia Gutu on 10/8/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

public struct Environment {
    
    public let coordinatorFactory: CoordinatorFactory
    public let vimeoVideoExtractor: VimeoVideoExtractor
    public let viewModelBuilder: ViewModelBuilder
    
    public let conferenceRepository: AnyRepository<Conference>
    public let talksRepository: AnyRepository<Topic>
    public let resourceRepository: AnyRepository<Resource>
    public let speakerRepository: AnyRepository<Speaker>
    
    public init(vimeoVideoExtractor: VimeoVideoExtractor = DefaultVimeoVideoExtractor(),
                coordinatorFactory: CoordinatorFactory = DefaultCoordinatorFactory(),
                viewModelBuilder: ViewModelBuilder? = nil ,
                conferenceRepository: AnyRepository<Conference> = AnyRepository(InCacheConferenceRepository()),
                talksRepository: AnyRepository<Topic> = AnyRepository(InCacheTalksRepository()),
                resourceRepository: AnyRepository<Resource> = AnyRepository(InCacheResourceRepository()),
                speakerRepository: AnyRepository<Speaker> = AnyRepository(InCacheSpeakersRepository())) {
        
        self.vimeoVideoExtractor = vimeoVideoExtractor
        self.viewModelBuilder = viewModelBuilder ?? AppViewModelBuilder(conferenceRepository, talksRepository, resourceRepository, speakerRepository)
        self.coordinatorFactory = coordinatorFactory
        self.conferenceRepository = conferenceRepository
        self.talksRepository = talksRepository
        self.resourceRepository = resourceRepository
        self.speakerRepository = speakerRepository
        
    }
}
