import UIKit
import Reusable

class SpeakerTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var speakerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.addShadow()
        SpeakerImageHelper.setupSpeakerImage(image: speakerImageView)
    }
}
