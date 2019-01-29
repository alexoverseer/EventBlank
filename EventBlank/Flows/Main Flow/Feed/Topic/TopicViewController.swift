import UIKit
import Kingfisher

class TopicViewController: UIViewController, TopicView {
    
    var viewModel: TopicViewModel!
    var onShowVideoPlayer: ((VimeoVideo?) -> Void)?
    
    @IBOutlet weak var topicNameLabel: UILabel!
    @IBOutlet weak var speakerImageView: UIImageView!
    @IBOutlet weak var speakerNameLabel: UILabel!
    @IBOutlet weak var speakerTitleLabel: UILabel!
    @IBOutlet weak var videoLoadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var videoThumbnailImageView: UIImageView!
    @IBOutlet weak var videoPlayButton: UIButton!
    
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
    
    @IBAction func showVideoPlayer() {
        let video = viewModel.getVideoDetails()
        onShowVideoPlayer?(video)
    }
    
    @IBAction func selectVideoQuality() {
        
    }
}

extension TopicViewController: TopicViewModelOutput {
    
    func showError(title: String, message: String) {
        showAlert(with: title, alertMessage: message)
    }
    
    func enablePlayerControlls() {
        self.videoLoadingIndicator.stopAnimating()
        self.videoPlayButton.isHidden = false
    }
    
    func setVideoThumbnail(url: URL) {
        self.videoThumbnailImageView?.kf.setImage(with: url,
                                                  placeholder: nil,
                                                  options: [.transition(.fade(0.5))],
                                                  progressBlock: nil,
                                                  completionHandler: { [weak self] result in
                                                    switch result {
                                                    case .success(let value):
                                                        self?.videoThumbnailImageView.image = value.image
                                                    case .failure(let error):
                                                        print("Error: \(error)")
                                                    }
        })
    }
}
