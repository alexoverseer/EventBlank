import Foundation

final class AppInfoCoordinator: BaseCoordinator {
    
    private let factory: AppInfoModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, factory: AppInfoModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showAppInfo()
    }
    
    private func showAppInfo() {
        let appInfoOutput = factory.makeAppInfoOutput()
        router.setRootModule(appInfoOutput)
    }
}
