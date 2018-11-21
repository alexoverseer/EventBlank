import Foundation
import Swinject

class ViewModelAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(ScheduleListViewModel.self) { _ in
            return DefaultScheduleListViewModel()
        }
        
        container.register(FeedListViewModel.self) { _ in
            return DefaultFeedListViewModel()
        }
        
        container.register(SpeakersListViewModel.self) { _ in
            return DefaultSpeakersListViewModel()
        }
    }
}
