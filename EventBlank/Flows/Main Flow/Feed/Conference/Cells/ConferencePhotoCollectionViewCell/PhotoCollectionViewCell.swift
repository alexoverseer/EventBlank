import UIKit
import Reusable

class PhotoCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
