import UIKit

protocol ConferenceViewModelOutput {
    func setTotalPhotosPagesNumber(pages: Int)
    func setCurrentPage(page: Int)
    func updateTableHeight()
    
    func openPhotoBrowser(originImage: UIImage?, images: [UIImage], cell: UICollectionViewCell)
    func openTopic()
    func openSpeaker()
}
