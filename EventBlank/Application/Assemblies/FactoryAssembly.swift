import Swinject

class FactoryAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(ScheduleModuleFactory.self) { resolver in
            return DefaultScheduleModuleFactory(resolver: resolver)
        }
        
        container.register(FeedModuleFactory.self) { resolver in
            return DefaultFeedModuleFactory(resolver: resolver)
        }
        
        container.register(SpeakersModuleFactory.self) { resolver in
            return DefaultSpeakersModuleFactory(resolver: resolver)
        }
    }
}
