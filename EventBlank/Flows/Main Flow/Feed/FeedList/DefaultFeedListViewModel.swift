import Foundation

final class DefaultFeedListViewModel: FeedListViewModel {
    
    var output: FeedListViewModelOutput?
    let builder = ViewModelBuilder.default
    
    var datasource: [ConferenceViewVModel] = [] {
        didSet {
            output?.reloadList()
        }
    }
    
    func onViewDidLoad(_ view: FeedListView) {
        datasource = builder.buildAllConferenceViewModels().reversed()
    }
}
