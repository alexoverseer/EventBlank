import UIKit

class SpeakersListViewController: UIViewController, SpeakersListView {

    var viewModel: SpeakersListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.onViewDidLoad(self)
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Speakers"
    }
}

extension SpeakersListViewController: SpeakersListViewModelOutput {
    
}
