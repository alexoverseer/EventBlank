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
    
    public init(vimeoVideoExtractor: VimeoVideoExtractor = DefaultVimeoVideoExtractor(),
                coordinatorFactory: CoordinatorFactory = DefaultCoordinatorFactory(),
                viewModelBuilder: ViewModelBuilder = DefaultViewModelBuilder()
    ) {
        
        self.vimeoVideoExtractor = vimeoVideoExtractor
        self.viewModelBuilder = viewModelBuilder
        self.coordinatorFactory = coordinatorFactory
    }
}
