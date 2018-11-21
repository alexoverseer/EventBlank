import Foundation

protocol FeedListView: BaseView {
    var viewModel: FeedListViewModel! { get set }
    var onShowConferenceDetails: (() -> Void)? { get set }
}
