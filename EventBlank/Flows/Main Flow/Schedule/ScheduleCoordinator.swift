import Foundation

final class ScheduleCoordinator: BaseCoordinator {
    
    private let factory: ScheduleModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, factory: ScheduleModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showScheduleList()
    }
    
    private func showScheduleList() {
        let scheduleOutput = factory.makeScheduleListOutput()
        router.setRootModule(scheduleOutput)
    }
}
