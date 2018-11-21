import Foundation

protocol ConferenceViewModel: class {
    var output: ConferenceViewModelOutput? { get set }
    func onViewDidLoad(_ view: ConferenceView)
}
