import Foundation
import Swinject

final class ApplicationCoordinator: BaseCoordinator {
    
    private let router: Router
    private let coordinatorFactory: CoordinatorFactory
    private let container: Resolver
    
    init(router: Router, coordinatorFactory: CoordinatorFactory, container: Resolver) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.container = container
    }
    
    override func start() {
        runMainFlow()
    }
    
    private func runMainFlow() {
        let (coordinator, module) = coordinatorFactory.makeTabBarCoordinator(router: router)
        addDependency(coordinator)
        router.setRootModule(module, hideBar: true)
        coordinator.start()
    }
}
