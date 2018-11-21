import UIKit

class ConferenceViewController: UIViewController, ConferenceView {
    
    var viewModel: ConferenceViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onViewDidLoad(self)
        setupUI()
    }
    
    private func setupUI() {
        #warning ("Replace with conference name!")
        navigationItem.title = "NSSpaint [2018]"
    }
}

extension ConferenceViewController: ConferenceViewModelOutput {
    
}
