import Foundation

final class FeedCoordinator: BaseCoordinator {
    
    private let factory: FeedModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, factory: FeedModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showFeedList()
    }
    
    private func showFeedList() {
        let feedOutput = factory.makeFeedListOutput()
        router.setRootModule(feedOutput)
    }
}
