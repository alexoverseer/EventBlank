import UIKit
import SKPhotoBrowser

final class DefaultFeedModuleFactory: BaseFactory, FeedModuleFactory {
    
    func makeFeedListOutput() -> FeedListView {
        let viewModel = resolver.resolve(FeedListViewModel.self)!
        let controller = FeedListViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
    
    func makeConferenceOutput(conference: ConferenceViewVModel) -> ConferenceView {
        let viewModel = resolver.resolve(ConferenceViewModel.self)!
        let controller = ConferenceViewController()
        viewModel.conference = conference
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
    
    func makeTopicOutput(topic: TalkViewVModel) -> TopicView {
        let viewModel = resolver.resolve(TopicViewModel.self)!
        let controller = TopicViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        viewModel.topic = topic
        
        return controller
    }
    
    func makeSpeakerOutput(speaker: SpeakerViewVModel) -> SpeakerView {
        let viewModel = resolver.resolve(SpeakerViewModel.self)!
        let controller = SpeakerViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        viewModel.profile = speaker
        
        return controller
    }
}
