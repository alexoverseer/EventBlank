import Foundation

protocol FeedListView: BaseView {
    var viewModel: FeedListViewModel! { get set }
    var onShowConferenceDetails: ((ConferenceViewVModel) -> Void)? { get set }
    
    func reloadList()
}
