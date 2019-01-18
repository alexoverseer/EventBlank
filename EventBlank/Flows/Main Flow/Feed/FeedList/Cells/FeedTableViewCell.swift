import UIKit
import Reusable

class FeedTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.addShadow()
    }
    
    func configure(with viewModel: ConferenceViewVModel) {
        titleLabel.text = viewModel.conference.title
        descLabel.text = viewModel.conference.description
    }
}
