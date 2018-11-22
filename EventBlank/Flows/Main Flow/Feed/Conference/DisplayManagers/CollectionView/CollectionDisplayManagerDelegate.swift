import UIKit

protocol CollectionDisplayManagerDelegate: class {
    func currentPhotoIndex(index: Int)
    func openPhotoBrowser(originImage: UIImage?, fromCell: UICollectionViewCell)
}
