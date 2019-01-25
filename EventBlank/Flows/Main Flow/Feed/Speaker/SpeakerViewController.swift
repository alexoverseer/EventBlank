import UIKit
import Kingfisher

class SpeakerViewController: UIViewController, SpeakerView {
    
    var viewModel: SpeakerViewModel!
    var onSelectTopic: ((TalkViewVModel) -> Void)?
    
    @IBOutlet weak var speakerImgeView: UIImageView!
    @IBOutlet weak var speakerNameLabel: UILabel!
    @IBOutlet weak var speakerTitleLabel: UILabel!
    @IBOutlet weak var topicsTableView: UITableView!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onViewDidLoad(self)
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Details"
        SpeakerImageHelper.setupSpeakerImage(image: speakerImgeView)
        topicsTableView.register(cellType: TopicTableViewCell.self)
        
        let speakerDetails = viewModel.speakerDetails()
        speakerNameLabel.text = speakerDetails.name
        speakerTitleLabel.text = speakerDetails.title
        speakerImgeView.kf.setImage(with: speakerDetails.imageURL)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        DispatchQueue.main.async {
            self.tableHeightConstraint.constant = self.topicsTableView.contentSize.height
        }
    }
    
    @IBAction func openTwitterProfile() {
        viewModel.openSpeakerTwitterPage()
    }
}

extension SpeakerViewController: SpeakerViewModelOutput {
    
    func reloadData() {
        topicsTableView.reloadData()
    }
}
