import Foundation
import Swinject

class ViewModelAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(FeedListViewModel.self) { _ in
            return DefaultFeedListViewModel()
        }
        
        container.register(AppInfoViewModel.self) { _ in
            return DefaultAppInfoViewModel()
        }
        
        container.register(FavouritesListViewModel.self) { _ in
            return DefaultFavouritesListViewModel()
        }
    }
}
