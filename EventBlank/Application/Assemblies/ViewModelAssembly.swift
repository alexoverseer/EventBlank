import Foundation
import Swinject

class ViewModelAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(FeedListViewModel.self) { resolver in
            return DefaultFeedListViewModel(builder: resolver.resolve(ViewModelBuilder.self)!)
        }
        
        container.register(AppInfoViewModel.self) { _ in
            return DefaultAppInfoViewModel()
        }
        
        container.register(FavouritesListViewModel.self) { _ in
            return DefaultFavouritesListViewModel()
        }
        
        container.register(ConferenceViewModel.self) { _ in
            return DefaultConferenceViewModel()
        }
        
        container.register(TopicViewModel.self) { _ in
            return DefaultTopicViewModel()
        }
        
        container.register(SpeakerViewModel.self) { resolver in
            return DefaultSpeakerViewModel(builder: resolver.resolve(ViewModelBuilder.self)!)
        }
    }
}
