import UIKit
import Reusable
import Kingfisher

class FeedTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.addShadow()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        thumbnail.image = nil
    }
    
    func configure(with viewModel: ConferenceViewVModel) {
        titleLabel.text = viewModel.conference.title
        descLabel.text = viewModel.conference.description
        loadImage(resource: viewModel.resouces.first)
    }
    
    private func loadImage(resource: Resource?) {
        guard let imageName = resource?.local else { return }
        thumbnail.image = UIImage(named: imageName)
    }
}
