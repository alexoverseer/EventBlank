import UIKit

protocol ConferenceViewModelOutput {
    func setTotalPhotosPagesNumber(pages: Int)
    func setCurrentPage(page: Int)
    func openPhotoBrowser(originImage: UIImage?, cell: UICollectionViewCell)
}
