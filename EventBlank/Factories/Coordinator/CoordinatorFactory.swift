import Foundation
import Swinject

protocol CoordinatorFactory {
 
    func makeTabBarCoordinator(router: Router) -> (configurator: Coordinator & MainTabCoordinatorOutput, toPresent: Presentable?)
    
    func makeFeedCoordinator(navigationController: UINavigationController?) -> Coordinator
    func makeAboutCoordinator(navigationController: UINavigationController?) -> Coordinator
    func makeFavouritesCoordinator(navigationController: UINavigationController?) -> Coordinator
}

extension CoordinatorFactory {
    
    var resolver: Resolver {
        return DefaultAppAssembler.shared.resolver
    }
}
