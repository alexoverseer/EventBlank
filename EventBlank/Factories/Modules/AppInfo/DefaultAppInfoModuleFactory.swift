import UIKit
import SKPhotoBrowser

public final class DefaultAppInfoModuleFactory: BaseFactory, AppInfoModuleFactory {
    
    public func makeAppInfoOutput() -> AppInfoView {
        let viewModel = DefaultAppInfoViewModel()
        let controller = AppInfoViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
    
    public func makeImageBrowserOutput(model: PhotoBrowserModel) -> Presentable {
        return makePhotoBrowserOutput(model: model)
    }
}
