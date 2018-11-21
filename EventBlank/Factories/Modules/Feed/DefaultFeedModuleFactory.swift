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
    
    func makePhotoBrowserOutput(model: PhotoBrowserModel) -> Presentable {
        
        let originImage = model.originImage ?? UIImage()
        let images = model.images.map { SKPhoto.photoWithImage($0) }
        let browser = SKPhotoBrowser(originImage: originImage,
                                     photos: images,
                                     animatedFromView: model.sourceView)
        
        browser.initializePageIndex(model.index)
        
        return browser
    }
}
