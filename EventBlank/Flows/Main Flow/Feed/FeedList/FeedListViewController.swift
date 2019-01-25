import UIKit

class FeedListViewController: UIViewController, FeedListView {
    
    @IBOutlet weak var feedTableView: UITableView!
    
    var viewModel: FeedListViewModel!
    var onShowConferenceDetails: ((ConferenceViewVModel) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onViewDidLoad(self)
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Feed"
        feedTableView.register(cellType: FeedTableViewCell.self)
        feedTableView.tableFooterView = UIView()
    }
    
    func reloadList() {
        self.feedTableView.reloadData()
    }
}

extension FeedListViewController: FeedListViewModelOutput {
    
}
