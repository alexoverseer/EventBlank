import UIKit
import SKPhotoBrowser
import AVKit

public final class DefaultFeedModuleFactory: BaseFactory, FeedModuleFactory {
    
    public func makeFeedListOutput() -> FeedListView {
        let viewModel = DefaultFeedListViewModel(builder: AppEnvironment.viewModelBuilder)
        
        let controller = FeedListViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
    
    public func makeConferenceOutput(conference: ConferenceViewVModel) -> ConferenceView {
        let viewModel = DefaultConferenceViewModel()
        let controller = ConferenceViewController()
        viewModel.conference = conference
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
    
    public func makeTopicOutput(topic: TalkViewVModel) -> TopicView {
        let viewModel = DefaultTopicViewModel(videoExtractor: AppEnvironment.videoExtractor)
        let controller = TopicViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        viewModel.topic = topic
        
        return controller
    }
    
    public func makeSpeakerOutput(speaker: SpeakerViewVModel) -> SpeakerView {
        let viewModel = DefaultSpeakerViewModel(builder: AppEnvironment.viewModelBuilder)
        let controller = SpeakerViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        viewModel.profile = speaker
        
        return controller
    }
    
    public func makeVideoPlayerOutput(videoURL: URL) -> Presentable {
        let player = AVPlayer(url: videoURL)
        let playerController = AVPlayerViewController()
        playerController.player = player
        
        return playerController
    }
}
