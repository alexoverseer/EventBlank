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
        conferenceOutput.onShowTopic = { [weak self] in
            self?.showTopicScreen()
        }
        conferenceOutput.onShowSpeaker = { [weak self] in
            self?.showSpeakerScreen()
        }
        router.push(conferenceOutput, animated: true)
    }
    
    private func showPhotoBrowser(model: PhotoBrowserModel) {
        let photoBrowserOutput = factory.makePhotoBrowserOutput(model: model)
        router.present(photoBrowserOutput, animated: true)
    }
    
    private func showTopicScreen() {
        let topicOutput = factory.makeTopicOutput()
        router.push(topicOutput, animated: true)
    }
    
    private func showSpeakerScreen() {
        let speakerOutput = factory.makeSpeakerOutput()
        router.push(speakerOutput, animated: true)
    }
}
