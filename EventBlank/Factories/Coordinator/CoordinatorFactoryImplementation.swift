import UIKit

final class CoordinatorFactoryImplementation: CoordinatorFactory {
    
    func makeTabBarCoordinator(router: Router) -> (configurator: Coordinator & MainTabCoordinatorOutput, toPresent: Presentable?) {
        
        typealias Color = Stylesheet.Color
        
        let controller = MainTabBarController()
        controller.view.tintColor = Color.appMagenta
        var controllers: [UINavigationController] = []
        
        for tabItem in TabItem.allCases {
            let tab = UITabBarItem(title: tabItem.title, image: tabItem.image, tag: 0)
            let navigationController = UINavigationController()
            navigationController.enableLargeTitles()
            navigationController.setTitleAttributesColor()
            navigationController.navigationBar.barTintColor = Color.appMagenta
            navigationController.navigationBar.tintColor = Color.appWhite
            
            navigationController.tabBarItem = tab
            controllers.append(navigationController)
        }
        controller.viewControllers = controllers
        
        let coordinator = MainTabBarCoordinator(mainTabBarView: controller,
                                                coordinatorFactory: CoordinatorFactoryImplementation(), router: router)
        
        return (coordinator, controller)
    }
    
    func makeFeedCoordinator(navigationController: UINavigationController?) -> Coordinator {
        
        let factory = DefaultFeedModuleFactory(resolver: self.resolver)
        let coordinator = FeedCoordinator(router: router(navigationController),
                                          factory: factory,
                                          coordinatorFactory: CoordinatorFactoryImplementation())
        
        return coordinator
    }
    
    func makeAboutCoordinator(navigationController: UINavigationController?) -> Coordinator {
        let factory = DefaultAppInfoModuleFactory(resolver: self.resolver)
        let coordinator = AppInfoCoordinator(router: router(navigationController),
                                             factory: factory,
                                             coordinatorFactory: CoordinatorFactoryImplementation())
        
        return coordinator
    }
    
    func makeFavouritesCoordinator(navigationController: UINavigationController?) -> Coordinator {
        let factory = DefaultFavouritesModuleFactory(resolver: self.resolver)
        let coordinator = FavouritesCoordinator(router: router(navigationController),
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
