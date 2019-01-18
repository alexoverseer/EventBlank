import Foundation

final class DefaultFeedListViewModel: FeedListViewModel {
    
    var output: FeedListViewModelOutput?
    let builder = ViewModelBuilder()
    var datasource: [ConferenceViewVModel] = [] {
        didSet {
            
        }
    }
    
    func onViewDidLoad(_ view: FeedListView) {
        datasource = builder.buildAllConferenceViewModels().reversed()
    }
}
