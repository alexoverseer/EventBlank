import Foundation
import Swinject

protocol CoordinatorFactory {
 
    func makeTabBarCoordinator(router: Router) -> (configurator: Coordinator & MainTabCoordinatorOutput, toPresent: Presentable?)
    
    func makeScheduleCoordinator(navigationController: UINavigationController?) -> Coordinator
    func makeFeedCoordinator(navigationController: UINavigationController?) -> Coordinator
    func makeSpeakersCoordinator(navigationController: UINavigationController?) -> Coordinator
}

extension CoordinatorFactory {
    
    var resolver: Resolver {
        return DefaultAppAssembler.shared.resolver
    }
}
