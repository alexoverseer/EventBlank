import UIKit
import Reusable

class SpeakerTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var speakerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.addShadow()
        setupSpeakerImage()
    }
    
    private func setupSpeakerImage() {
        speakerImageView.layer.borderWidth = 3
        speakerImageView.layer.borderColor = Stylesheet.Color.appMagenta.cgColor
        speakerImageView.layer.cornerRadius = speakerImageView.frame.width / 2
    }
}
