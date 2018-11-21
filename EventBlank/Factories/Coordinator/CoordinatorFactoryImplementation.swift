import UIKit

final class CoordinatorFactoryImplementation: CoordinatorFactory {
    
    func makeTabBarCoordinator(router: Router) -> (configurator: Coordinator & MainTabCoordinatorOutput, toPresent: Presentable?) {
        
        typealias Color = Stylesheet.Color
        
        let controller = MainTabBarController()
        controller.view.tintColor = Color.appRed
        var controllers: [UINavigationController] = []
        
        for tabItem in TabItem.allCases {
            let tab = UITabBarItem(title: tabItem.title, image: tabItem.image, tag: 0)
            let navigationController = UINavigationController()
            navigationController.enableLargeTitles()
            navigationController.setLightTitleAttributes()
            navigationController.navigationBar.barTintColor = Color.appRed
            navigationController.navigationBar.isTranslucent = false
            
            navigationController.tabBarItem = tab
            controllers.append(navigationController)
        }
        controller.viewControllers = controllers
        
        let coordinator = MainTabBarCoordinator(mainTabBarView: controller,
                                                coordinatorFactory: CoordinatorFactoryImplementation(), router: router)
        
        return (coordinator, controller)
    }
    
    func makeScheduleCoordinator(navigationController: UINavigationController?) -> Coordinator {
        
        let factory = DefaultScheduleModuleFactory(resolver: self.resolver)
        let coordinator = ScheduleCoordinator(router: router(navigationController),
                                              factory: factory,
                                              coordinatorFactory: CoordinatorFactoryImplementation())
        
        return coordinator
    }
    
    func makeFeedCoordinator(navigationController: UINavigationController?) -> Coordinator {
        
        let factory = DefaultFeedModuleFactory(resolver: self.resolver)
        let coordinator = FeedCoordinator(router: router(navigationController),
                                          factory: factory,
                                          coordinatorFactory: CoordinatorFactoryImplementation())
        
        return coordinator
    }
    
    func makeSpeakersCoordinator(navigationController: UINavigationController?) -> Coordinator {
        let factory = DefaultSpeakersModuleFactory(resolver: self.resolver)
        let coordinator = SpeakersCoordinator(router: router(navigationController),
                                              factory: factory,
                                              coordinatorFactory: CoordinatorFactoryImplementation())
        
        return coordinator
    }
}

extension CoordinatorFactoryImplementation {
    
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImplementation(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        } else {
            return UINavigationController()
        }
    }
}
