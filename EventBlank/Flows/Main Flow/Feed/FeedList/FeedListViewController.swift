import UIKit

class FeedListViewController: UIViewController, FeedListView {
    
    @IBOutlet weak var feedTableView: UITableView!
    
    var viewModel: FeedListViewModel!
    var onShowConferenceDetails: ((ConferenceViewVModel) -> Void)?
    let cellComposer = DataCellComposer()
    
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

extension FeedListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FeedTableViewCell = tableView.dequeueReusableCell(for: indexPath)
//        cell.configure(with: viewModel.datasource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let cell = cell as? FeedTableViewCell else { fatalError("Expected to display a `FeedTableViewCell`.") }
        let item = viewModel.datasource[indexPath.row]
        
        cellComposer.compose(cell, withDataItem: item)
    }
}

extension FeedListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onShowConferenceDetails?(viewModel.datasource[indexPath.row])
    }
}
