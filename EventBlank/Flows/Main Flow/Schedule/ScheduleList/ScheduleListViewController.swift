import UIKit

class ScheduleListViewController: UIViewController, ScheduleListView {

    var viewModel: ScheduleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.onViewDidLoad(self)
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Schedule"
    }
}

extension ScheduleListViewController: ScheduleListViewModelOutput {
    
}
