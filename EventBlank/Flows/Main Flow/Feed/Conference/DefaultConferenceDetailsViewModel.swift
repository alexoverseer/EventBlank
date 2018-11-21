import UIKit

final class DefaultConferenceViewModel: ConferenceViewModel {
    
    var output: ConferenceViewModelOutput?
    var collectionDisplayManager: CollectionDisplayManager?
    var tableDisplayManager: TableDisplayManager?
    
    func onViewDidLoad(_ view: ConferenceView) {
        
        let testPhotoList = ["1", "2", "3"]
        let testTopicsList = ["1", "2", "3"]
        
        output?.setTotalPhotosPagesNumber(pages: testPhotoList.count)
        
        collectionDisplayManager?.updatContent(with: testPhotoList)
        tableDisplayManager?.updatContent(with: testTopicsList)
    }
    
    func registerCollection(_ collectionView: UICollectionView) {
        #warning ("Replace String -> ViewModel")
        collectionDisplayManager = CollectionDisplayManager(with: collectionView)
        collectionDisplayManager?.delegate = self
    }
    
    func registerTable(_ tableView: UITableView) {
        #warning ("Replace String -> ViewModel")
        tableDisplayManager = TableDisplayManager(with: tableView)
    }
}

extension DefaultConferenceViewModel: CollectionDisplayManagerDelegate {
    
    func currentPhotoIndex(index: Int) {
        output?.setCurrentPage(page: index)
    }
    
    func openPhotoBrowser(originImage: UIImage?, fromCell: UICollectionViewCell) {
        output?.openPhotoBrowser(originImage: originImage, cell: fromCell)
    }
}
