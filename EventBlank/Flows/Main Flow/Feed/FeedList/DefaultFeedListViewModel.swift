import Foundation

final class DefaultFeedListViewModel: FeedListViewModel {
    
    var output: FeedListViewModelOutput?
    var datasource: [ConferenceViewVModel] = [] {
        didSet {
            output?.reloadList()
        }
    }

    private var builder: ViewModelBuilder
    
    init(builder: ViewModelBuilder) {
        self.builder = builder
    }
    
    func onViewDidLoad(_ view: FeedListView) {
        datasource = builder.buildConferenceViewModels().reversed()
    }
}
