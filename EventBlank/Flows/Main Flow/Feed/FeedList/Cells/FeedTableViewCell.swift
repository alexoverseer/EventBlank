import UIKit
import Reusable

class FeedTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.addShadow()
    }
}
