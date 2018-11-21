import Foundation

final class DefaultAppInfoModuleFactory: BaseFactory, AppInfoModuleFactory {
    
    func makeAppInfoOutput() -> AppInfoView {
        let viewModel = resolver.resolve(AppInfoViewModel.self)!
        let controller = AppInfoViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
}
