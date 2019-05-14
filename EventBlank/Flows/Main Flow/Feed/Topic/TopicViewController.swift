import UIKit
import Kingfisher

class TopicViewController: UIViewController, TopicView {
    
    var viewModel: TopicViewModel!
    var onShowVideoPlayer: ((VimeoVideo?) -> Void)?
    var onShowSpeaker: ((SpeakerViewVModel) -> Void)?
    
    @IBOutlet weak var topicNameLabel: UILabel!
    @IBOutlet weak var speakerImageView: UIImageView!
    @IBOutlet weak var speakerNameLabel: UILabel!
    @IBOutlet weak var speakerTitleLabel: UILabel!
    @IBOutlet weak var videoLoadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var videoThumbnailImageView: UIImageView!
    @IBOutlet weak var videoPlayButton: UIButton!
    @IBOutlet weak var videoQualityStackView: UIStackView!
    @IBOutlet weak var videoResolutionLabel: UILabel!
    
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
        showActionSheet { [weak self] selectedQuality in
            self?.viewModel.setVideoQuality(quality: selectedQuality)
        }
    }
    
    @IBAction func showSpeaker() {
        let speaker = viewModel.topic.speaker
        onShowSpeaker?(speaker)
    }
}

extension TopicViewController: TopicViewModelOutput {
    
    func showError(title: String, message: String) {
        showAlert(with: title, alertMessage: message)
    }
    
    func enablePlayerControlls() {
        self.videoLoadingIndicator.stopAnimating()
        self.videoPlayButton.isHidden = false
        self.videoQualityStackView.isHidden = false
    }
    
    func updateVideoQuality() {
        videoResolutionLabel.text = viewModel.currentVideoQuality()
    }
    
    func setVideoThumbnail(url: URL) {
        self.videoThumbnailImageView?.kf.setImage(with: url,
                                                  placeholder: nil,
                                                  options: [.transition(.fade(0.4))],
                                                  progressBlock: nil,
                                                  completionHandler: { [weak self] result in
                                                    if let value = result.value {
                                                        self?.videoThumbnailImageView.image = value.image
                                                    }
        })
    }
}

extension TopicViewController {
    
    func showActionSheet(handler: ((String?) -> Void)?) {
        let optionMenu = UIAlertController(title: "Select quality",
                                           message: nil,
                                           preferredStyle: .actionSheet)
        
        viewModel.getVideoDetails()?.qualities?.forEach {
            let action = UIAlertAction(title: $0, style: .default, handler: { action in
                handler?(action.title)
            })
            optionMenu.addAction(action)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
}
