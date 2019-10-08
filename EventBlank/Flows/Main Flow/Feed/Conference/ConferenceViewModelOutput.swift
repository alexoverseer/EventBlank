import UIKit

public protocol ConferenceViewModelOutput {
    func setTotalPhotosPagesNumber(pages: Int)
    func setCurrentPage(page: Int)
    func updateTableHeight()
    
    func openPhotoBrowser(originImage: UIImage?, images: [UIImage], cell: UICollectionViewCell)
    func openTopic(topic: TalkViewVModel)
    func openSpeaker(speaker: SpeakerViewVModel)
}
