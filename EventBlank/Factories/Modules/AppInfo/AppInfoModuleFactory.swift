import Foundation

protocol AppInfoModuleFactory {
    func makeAppInfoOutput() -> AppInfoView
    func makeImageBrowserOutput(model: PhotoBrowserModel) -> Presentable
}
