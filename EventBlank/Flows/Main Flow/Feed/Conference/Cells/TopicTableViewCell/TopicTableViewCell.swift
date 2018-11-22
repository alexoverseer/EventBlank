import UIKit
import Reusable

class TopicTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.addShadow()
    }
}
