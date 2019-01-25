//
//  BuilderAssembly.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/24/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Swinject

class BuilderAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(ViewModelBuilder.self) { _ in
            return DefaultViewModelBuilder()
        }
    }
}
