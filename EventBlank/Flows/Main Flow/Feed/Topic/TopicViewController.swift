import UIKit
import Kingfisher

class TopicViewController: UIViewController, TopicView {

    var viewModel: TopicViewModel!
    
    @IBOutlet weak var topicNameLabel: UILabel!
    @IBOutlet weak var speakerImageView: UIImageView!
    @IBOutlet weak var speakerNameLabel: UILabel!
    @IBOutlet weak var speakerTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onViewDidLoad(self)
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Topic"
        
        topicNameLabel.text = viewModel.topicName()
        let speakerDetails = viewModel.speakerDetails()
        
        speakerNameLabel.text = speakerDetails.name
        speakerTitleLabel.text = speakerDetails.title
        speakerImageView.kf.setImage(with: speakerDetails.imageURL)
    }
}

extension TopicViewController: TopicViewModelOutput {
    
}
