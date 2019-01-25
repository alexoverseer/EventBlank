import UIKit

final class MainTabBarCoordinator: BaseCoordinator, MainTabCoordinatorOutput {
    
    private let mainTabBarView: MainTabBarView
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(mainTabBarView: MainTabBarView,
         coordinatorFactory: CoordinatorFactory,
         router: Router) {
        self.mainTabBarView = mainTabBarView
        self.coordinatorFactory = coordinatorFactory
        self.router = router
    }
    
    override func start() {
        mainTabBarView.onFeedFlowSelect = runFeedFlow()
        mainTabBarView.startFlow()
        mainTabBarView.onAboutFlowSelect = runAboutFlow()
        mainTabBarView.onFavouritesFlowSelect = runFavouritesFlow()
    }
    
    private func runFeedFlow() -> ((UINavigationController) -> Void) {
        return { navigationController in
            if navigationController.viewControllers.isEmpty == true {
                let feedCoordinator = self.coordinatorFactory.makeFeedCoordinator(navigationController: navigationController)
                feedCoordinator.start()
                self.addDependency(feedCoordinator)
            }
        }
    }
    
    private func runAboutFlow() -> ((UINavigationController) -> Void) {
        return { navigationController in
            if navigationController.viewControllers.isEmpty == true {
                let aboutCoordinator = self.coordinatorFactory.makeAboutCoordinator(navigationController: navigationController)
                aboutCoordinator.start()
                self.addDependency(aboutCoordinator)
            }
        }
    }
    
    private func runFavouritesFlow() -> ((UINavigationController) -> Void) {
        return { navigationController in
            if navigationController.viewControllers.isEmpty == true {
                let favouritesCoordinator = self.coordinatorFactory.makeFavouritesCoordinator(navigationController: navigationController)
                favouritesCoordinator.start()
                self.addDependency(favouritesCoordinator)
            }
        }
    }
}
