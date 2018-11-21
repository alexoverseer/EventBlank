import Swinject

class FactoryAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(FeedModuleFactory.self) { resolver in
            return DefaultFeedModuleFactory(resolver: resolver)
        }
        
        container.register(AppInfoModuleFactory.self) { resolver in
            return DefaultAppInfoModuleFactory(resolver: resolver)
        }
        
        container.register(FavouritesModuleFactory.self) { resolver in
            return DefaultFavouritesModuleFactory(resolver: resolver)
        }
    }
}
