import UIKit

class AppInfoViewController: UIViewController, AppInfoView {

    var viewModel: AppInfoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onViewDidLoad(self)
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "About"
    }
}

extension AppInfoViewController: AppInfoViewModelOutput {
    
}
