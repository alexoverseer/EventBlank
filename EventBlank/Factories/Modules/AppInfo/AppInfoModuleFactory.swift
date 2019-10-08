import Foundation

public protocol AppInfoModuleFactory: class {
    func makeAppInfoOutput() -> AppInfoView
    func makeImageBrowserOutput(model: PhotoBrowserModel) -> Presentable
}
