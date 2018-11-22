import UIKit

class TopicViewController: UIViewController, TopicView {

    var viewModel: TopicViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onViewDidLoad(self)
        setupUI()
    }

    private func setupUI() {
        #warning ("replace with topic title")
        navigationItem.title = "Topic #1"
    }
}

extension TopicViewController: TopicViewModelOutput {
    
}
