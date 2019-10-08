import Foundation

public protocol FeedListViewModel: class {
    var output: FeedListViewModelOutput? { get set }
    var datasource: [ConferenceViewVModel] { get set }
    
    func onViewDidLoad(_ view: FeedListView)
}
