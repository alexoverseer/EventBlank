import UIKit

final class MainTabBarCoordinator: BaseCoordinator, MainTabCoordinatorOutput {
    
    private let mainTabBarView: MainTabBarView
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(mainTabBarView: MainTabBarView, coordinatorFactory: CoordinatorFactory, router: Router) {
        self.mainTabBarView = mainTabBarView
        self.coordinatorFactory = coordinatorFactory
        self.router = router
    }
    
    override func start() {
        mainTabBarView.onScheduleFlowSelect = runScheduleFlow()
        mainTabBarView.startFlow()
        mainTabBarView.onFeedFlowSelect = runFeedFlow()
        mainTabBarView.onSpeakersFlowSelect = runSpeakersFlow()
    }
    
    private func runScheduleFlow() -> ((UINavigationController) -> Void) {
        return { navigationController in
            if navigationController.viewControllers.isEmpty == true {
                let scheduleCoordinator = self.coordinatorFactory.makeScheduleCoordinator(navigationController: navigationController)
                scheduleCoordinator.start()
                self.addDependency(scheduleCoordinator)
            }
        }
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
    
    private func runSpeakersFlow() -> ((UINavigationController) -> Void) {
        return { navigationController in
            if navigationController.viewControllers.isEmpty == true {
                
            }
        }
    }
}
