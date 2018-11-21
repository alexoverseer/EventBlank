import Foundation

final class FavouritesCoordinator: BaseCoordinator {
    
    private let factory: FavouritesModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, factory: FavouritesModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showFavouritesList()
    }
    
    private func showFavouritesList() {
        let favouritesOutput = factory.makeFavouritesListOutput()
        router.setRootModule(favouritesOutput)
    }
}
