import UIKit

public final class DefaultCoordinatorFactory: NSObject, CoordinatorFactory {
    
    public func makeTabBarCoordinator(router: Router) -> (configurator: Coordinator & MainTabCoordinatorOutput, toPresent: Presentable?) {
        
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
                                                coordinatorFactory: DefaultCoordinatorFactory(), router: router)
        
        return (coordinator, controller)
    }
    
    public func makeFeedCoordinator(navigationController: UINavigationController?) -> Coordinator {
        
        let factory = DefaultFeedModuleFactory()
        let coordinator = FeedCoordinator(router: router(navigationController),
                                          factory: factory,
                                          coordinatorFactory: DefaultCoordinatorFactory())
        
        return coordinator
    }
    
    public func makeAboutCoordinator(navigationController: UINavigationController?) -> Coordinator {
        let factory = DefaultAppInfoModuleFactory()
        let coordinator = AppInfoCoordinator(router: router(navigationController),
                                             factory: factory,
                                             coordinatorFactory: DefaultCoordinatorFactory())
        
        return coordinator
    }
    
    public func makeFavouritesCoordinator(navigationController: UINavigationController?) -> Coordinator {
        let factory = DefaultFavouritesModuleFactory()
        let coordinator = FavouritesCoordinator(router: router(navigationController),
                                                factory: factory,
                                                coordinatorFactory: DefaultCoordinatorFactory())
        
        return coordinator
    }
}

extension DefaultCoordinatorFactory {
    
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
