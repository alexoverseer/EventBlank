import UIKit

final class AppInfoCoordinator: BaseCoordinator {
    
    private let factory: AppInfoModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, factory: AppInfoModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showAppInfo()
    }
    
    private func showAppInfo() {
        let appInfoOutput = factory.makeAppInfoOutput()
        appInfoOutput.onOpenMapImage = { [weak self] sourceImge, sourceView in
            self?.openImageBrowser(sourceImage: sourceImge, sourceView: sourceView)
        }
        router.setRootModule(appInfoOutput)
    }
    
    private func openImageBrowser(sourceImage: UIImage?, sourceView: UIView) {
        let model = PhotoBrowserModel(originImage: sourceImage,
                                      sourceView: sourceView)
        let imageBrowserOutput = factory.makeImageBrowserOutput(model: model)
        router.present(imageBrowserOutput, animated: true)
    }
}
