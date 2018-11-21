import Foundation

protocol FeedListViewModel: class {
    var output: FeedListViewModelOutput? { get set }
    func onViewDidLoad(_ view: FeedListView)
}
