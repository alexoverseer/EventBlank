import Foundation

final class SpeakersCoordinator: BaseCoordinator {
    
    private let factory: SpeakersModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, factory: SpeakersModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showSpeakerList()
    }
    
    private func showSpeakerList() {
        let speakersOutput = factory.makeSpeakersListOutput()
        router.setRootModule(speakersOutput)
    }
}
