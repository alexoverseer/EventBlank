import UIKit
import SKPhotoBrowser

final class DefaultAppInfoModuleFactory: BaseFactory, AppInfoModuleFactory {
    
    func makeAppInfoOutput() -> AppInfoView {
        let viewModel = resolver.resolve(AppInfoViewModel.self)!
        let controller = AppInfoViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
    
    func makeImageBrowserOutput(model: PhotoBrowserModel) -> Presentable {
        return makePhotoBrowserOutput(model: model)
    }
}
