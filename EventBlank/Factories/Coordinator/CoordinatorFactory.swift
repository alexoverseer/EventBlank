import UIKit

public protocol CoordinatorFactory {
    
    func makeTabBarCoordinator(router: Router) -> (configurator: Coordinator & MainTabCoordinatorOutput, toPresent: Presentable?)
    
    func makeFeedCoordinator(navigationController: UINavigationController?) -> Coordinator
    func makeAboutCoordinator(navigationController: UINavigationController?) -> Coordinator
    func makeFavouritesCoordinator(navigationController: UINavigationController?) -> Coordinator
}
