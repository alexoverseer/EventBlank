//
//  AppEnvironment.swift
//  EventBlank
//
//  Created by Ilia Gutu on 10/8/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

public struct AppEnvironment {
    /**
     A global stack of environments.
     */
    fileprivate static var stack: [Environment] = [Environment()]
    
    // The most recent environment on the stack.
    public static var current: Environment! {
        return stack.last
    }
}

extension AppEnvironment {
    
    static var viewModelBuilder: ViewModelBuilder {
        return current.viewModelBuilder
    }
    
    static var videoExtractor: VimeoVideoExtractor {
        return current.vimeoVideoExtractor
    }
}
