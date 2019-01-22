import UIKit
import Reusable
import Kingfisher

class SpeakerTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var speakerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.addShadow()
        SpeakerImageHelper.setupSpeakerImage(image: speakerImageView)
    }
    
    func configure(with model: SpeakerViewVModel) {
        nameLabel.text = model.name
        titleLabel.text = model.title
        titleLabel.isHidden = model.title.isEmpty
        loadSpeakerImage(imageURL: model.photo)
    }
    
    func loadSpeakerImage(imageURL: String) {
        speakerImageView?.kf.setImage(with: URL(string: imageURL),
                                      placeholder: nil,
                                      options: [.transition(.fade(0.3))],
                                      progressBlock: nil,
                                      completionHandler: { [weak self] result in
                                        switch result {
                                        case .success(let value):
                                            self?.speakerImageView.image = value.image
                                        case .failure(let error):
                                            print("Error: \(error)")
                                        }
        })
    }
}
