import Foundation

final class DefaultFeedModuleFactory: BaseFactory, FeedModuleFactory {
    
    func makeFeedListOutput() -> FeedListView {
        let viewModel = resolver.resolve(FeedListViewModel.self)!
        let controller = FeedListViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
}
