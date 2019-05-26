import Foundation

protocol AppInfoViewModel: class {
    var output: AppInfoViewModelOutput? { get set }
    func onViewDidLoad(_ view: AppInfoView)
    func buildLocation()
    func openEventLocation()
}
