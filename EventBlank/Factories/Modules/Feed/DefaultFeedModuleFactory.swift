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
    
    func makeConferenceOutput() -> ConferenceView {
        let viewModel = resolver.resolve(ConferenceViewModel.self)!
        let controller = ConferenceViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
    
    func makeTopicOutput() -> TopicView {
        let viewModel = resolver.resolve(TopicViewModel.self)!
        let controller = TopicViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
    
    func makeSpeakerOutput() -> SpeakerView {
        let viewModel = resolver.resolve(SpeakerViewModel.self)!
        let controller = SpeakerViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
}
