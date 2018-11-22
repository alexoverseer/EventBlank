import UIKit

class SpeakerViewController: UIViewController, SpeakerView {

    var viewModel: SpeakerViewModel!
    var onSelectTopic: ((TalkViewModel) -> Void)?
    
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
        self.topicsTableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.tableHeightConstraint.constant = self.topicsTableView.contentSize.height
        }
    }
}

extension SpeakerViewController: SpeakerViewModelOutput {
    
}
