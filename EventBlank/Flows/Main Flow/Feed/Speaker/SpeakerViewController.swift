import UIKit

class SpeakerViewController: UIViewController, SpeakerView {

    var viewModel: SpeakerViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.onViewDidLoad(self)
        setupUI()
    }

    private func setupUI() {
        navigationItem.title = "Details"
    }
}

extension SpeakerViewController: SpeakerViewModelOutput {
    
}
