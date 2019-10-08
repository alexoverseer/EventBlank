//
//  Environment.swift
//  EventBlank
//
//  Created by Ilia Gutu on 10/8/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

public struct Environment {
    
    public let feedModuleFactory: FeedModuleFactory
    
    public let appInfoModuleFactory: AppInfoModuleFactory
    
     public let favoritesModuleFactory: FavouritesModuleFactory
    
    public let vimeoVideoExtractor: VimeoVideoExtractor
    public let viewModelBuilder: ViewModelBuilder
    
    public init(vimeoVideoExtractor: VimeoVideoExtractor = DefaultVimeoVideoExtractor(),
                feedModuleFactory: FeedModuleFactory = DefaultFeedModuleFactory() ,
                appInfoModuleFactory: AppInfoModuleFactory = DefaultAppInfoModuleFactory(),
                favoritesModuleFactory: FavouritesModuleFactory = DefaultFavouritesModuleFactory(),
                viewModelBuilder: ViewModelBuilder = DefaultViewModelBuilder()
    ) {
        
        self.vimeoVideoExtractor = vimeoVideoExtractor
        self.feedModuleFactory = feedModuleFactory
        self.appInfoModuleFactory = appInfoModuleFactory
        self.favoritesModuleFactory = favoritesModuleFactory
        self.viewModelBuilder = viewModelBuilder
    }
}
