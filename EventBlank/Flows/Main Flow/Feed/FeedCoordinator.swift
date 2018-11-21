import Foundation
import SKPhotoBrowser

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
        feedOutput.onShowConferenceDetails = { [weak self] in
            self?.showConferenceDetails()
        }
        router.setRootModule(feedOutput)
    }
    
    private func showConferenceDetails() {
        let conferenceOutput = factory.makeConferenceOutput()
        conferenceOutput.onShowPhotoBrowser = { [weak self] model in
            self?.showPhotoBrowser(model: model)
        }
        router.push(conferenceOutput)
    }
    
    private func showPhotoBrowser(model: PhotoBrowserModel) {
        
        let photoBrowserOutput = factory.makePhotoBrowserOutput(model: model)
        router.present(photoBrowserOutput, animated: true)
    }
}
