import UIKit

final class DefaultConferenceViewModel: ConferenceViewModel {
    
    var output: ConferenceViewModelOutput?
    var collectionDisplayManager: CollectionDisplayManager?
    var tableDisplayManager: TableDisplayManager?
    var conference:ConferenceViewVModel!
    
    
    var topics:[TalkViewModel]{
        return conference.topics
    }
    
    var speakers:[SpeakerViewVModel]{
        return conference.people
    }
    
    func onViewDidLoad(_ view: ConferenceView) {
        
        let testPhotoList = ["1", "2", "3"]
        let testTopicsList = Array(0...3).map {"\($0)"}
        
        output?.setTotalPhotosPagesNumber(pages: testPhotoList.count)
        
        collectionDisplayManager?.updatContent(with: testPhotoList)
        tableDisplayManager?.updatContent(with: testTopicsList)
        
        output?.updateTableHeight()
    }
    
    func registerCollection(_ collectionView: UICollectionView) {
        #warning ("Replace String -> ViewModel")
        collectionDisplayManager = CollectionDisplayManager(with: collectionView)
        collectionDisplayManager?.delegate = self
    }
    
    func registerTable(_ tableView: UITableView) {
        #warning ("Replace String -> ViewModel")
        tableDisplayManager = TableDisplayManager(with: tableView)
        tableDisplayManager?.delegate = self
    }
    
    func changeTableType(selectedType: SelectedConferenceType) {
        tableDisplayManager?.switchTableType(type: selectedType)
    }
}

extension DefaultConferenceViewModel: CollectionDisplayManagerDelegate {
    
    func currentPhotoIndex(index: Int) {
        output?.setCurrentPage(page: index)
    }
    
    func openPhotoBrowser(originImage: UIImage?, fromCell: UICollectionViewCell) {
        let images = [#imageLiteral(resourceName: "blank.conference.jpg"), #imageLiteral(resourceName: "blank.conference.jpg"), #imageLiteral(resourceName: "blank.conference.jpg")]
        output?.openPhotoBrowser(originImage: originImage, images: images, cell: fromCell)
    }
}

extension DefaultConferenceViewModel: TableDisplayManagerDelegate {
    
    func didSelectTopic(at index: Int) {
        #warning ("Send Topic")
        output?.openTopic(topic:topics[index])
    }
    
    func didSelectSpeaker(at index: Int) {
        #warning ("Send Speaker")
        output?.openSpeaker(speaker:speakers[index])
    }
}
