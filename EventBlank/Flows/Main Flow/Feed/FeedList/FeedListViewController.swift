import UIKit

class FeedListViewController: UIViewController, FeedListView {
    
    
    func reloadList() {
        self.feedTableView.reloadData()
    }
    

    
    var viewModel: FeedListViewModel!
    var onShowConferenceDetails: ((ConferenceViewVModel) -> Void)?
    
    @IBOutlet weak var feedTableView: UITableView!
    
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
}

extension FeedListViewController: FeedListViewModelOutput {
    
}

extension FeedListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FeedTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel.datasource[indexPath.row])
        return cell
    }
}

extension FeedListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onShowConferenceDetails?(viewModel.datasource[indexPath.row])
    }
}
