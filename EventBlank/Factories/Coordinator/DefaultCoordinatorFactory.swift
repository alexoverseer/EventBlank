import UIKit

public final class DefaultCoordinatorFactory: NSObject, CoordinatorFactory {
    
    let feedModuleFactory: FeedModuleFactory
    let appInfoModuleFactory: AppInfoModuleFactory
    let favouritesModuleFactory: FavouritesModuleFactory
    
    public init(feedModuleFactory: FeedModuleFactory = DefaultFeedModuleFactory(),
                appInfoModuleFactory: AppInfoModuleFactory = DefaultAppInfoModuleFactory(),
                favouritesModuleFactory: FavouritesModuleFactory = DefaultFavouritesModuleFactory()){
        
        self.feedModuleFactory = feedModuleFactory
        self.appInfoModuleFactory = appInfoModuleFactory
        self.favouritesModuleFactory = favouritesModuleFactory
    }
    
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
                                                coordinatorFactory: self, router: router)
        
        return (coordinator, controller)
    }
    
    public func makeFeedCoordinator(navigationController: UINavigationController?) -> Coordinator {

        let coordinator = FeedCoordinator(router: router(navigationController),
                                          factory: feedModuleFactory,
                                          coordinatorFactory: self)
        
        return coordinator
    }
    
    public func makeAboutCoordinator(navigationController: UINavigationController?) -> Coordinator {
        let coordinator = AppInfoCoordinator(router: router(navigationController),
                                             factory: appInfoModuleFactory,
                                             coordinatorFactory: self)
        
        return coordinator
    }
    
    public func makeFavouritesCoordinator(navigationController: UINavigationController?) -> Coordinator {
 
        let coordinator = FavouritesCoordinator(router: router(navigationController),
                                                factory: favouritesModuleFactory,
                                                coordinatorFactory: self)
        
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
