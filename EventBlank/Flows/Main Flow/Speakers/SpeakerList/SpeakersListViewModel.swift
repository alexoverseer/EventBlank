import Foundation

protocol SpeakersListViewModel: class {
    var output: SpeakersListViewModelOutput? { get set }
    func onViewDidLoad(_ view: SpeakersListView)
}
