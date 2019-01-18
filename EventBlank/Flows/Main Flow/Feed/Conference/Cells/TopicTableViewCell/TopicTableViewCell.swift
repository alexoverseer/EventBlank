import UIKit
import Reusable

class TopicTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var shadowView: UIView!
    
    @IBOutlet weak var topicTitleLabel: UILabel!
    @IBOutlet weak var speakerLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.addShadow()
    }
    
    func configure(with model: Topic) {
        topicTitleLabel.text = model.title
        speakerLabel.text = model.speaker
        print(model.startDate)
    }
}
