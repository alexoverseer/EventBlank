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
        feedOutput.onShowConferenceDetails = { [weak self] conference  in
            self?.showConferenceDetails(conference: conference)
        }
        router.setRootModule(feedOutput)
    }
    
    private func showConferenceDetails(conference: ConferenceViewVModel) {
        let conferenceOutput = factory.makeConferenceOutput(conference: conference)
        conferenceOutput.onShowPhotoBrowser = { [weak self] model in
            self?.showPhotoBrowser(model: model)
        }
        conferenceOutput.onShowTopic = { [weak self] topic in
            self?.showTopicScreen(topic: topic)
        }
        conferenceOutput.onShowSpeaker = { [weak self] speaker in
            self?.showSpeakerScreen(speaker: speaker)
        }
        router.push(conferenceOutput, animated: true)
    }
    
    private func showPhotoBrowser(model: PhotoBrowserModel) {
        let photoBrowserOutput = factory.makePhotoBrowserOutput(model: model)
        router.present(photoBrowserOutput, animated: true)
    }
    
    private func showTopicScreen(topic: TalkViewVModel) {
        let topicOutput = factory.makeTopicOutput(topic: topic)
        topicOutput.onShowVideoPlayer = { [weak self] video in
            self?.showAVPlayerViewController(video: video)
        }
        router.push(topicOutput, animated: true)
    }
    
    private func showSpeakerScreen(speaker: SpeakerViewVModel) {
        let speakerOutput = factory.makeSpeakerOutput(speaker: speaker)
        speakerOutput.onSelectTopic = { [weak self] topic in
            self?.showTopicScreen(topic: topic)
        }
        router.push(speakerOutput, animated: true)
    }
    
    private func showAVPlayerViewController(video: VimeoVideo?) {
        guard let vimeoVideo = video else { return }
        guard let videoURL = vimeoVideo.videoURL else { return }
        let videoPlayerOutput = factory.makeVideoPlayerOutput(videoURL: videoURL)
        router.present(videoPlayerOutput, animated: true)
    }
}
