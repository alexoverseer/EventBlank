import UIKit

class FeedListViewController: UIViewController, FeedListView {

    var viewModel: FeedListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.onViewDidLoad(self)
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Feed"
    }
}

extension FeedListViewController: FeedListViewModelOutput {
    
}
