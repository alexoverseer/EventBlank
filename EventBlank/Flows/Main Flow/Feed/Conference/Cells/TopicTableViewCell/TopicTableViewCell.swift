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
    
    func configure(with model: TalkViewModel) {
        topicTitleLabel.text = model.talk.title
        speakerLabel.text = model.speaker.name
        startDateLabel.text = model.talk.dateStart
        endDateLabel.text = model.talk.dateEnd
    }
}
