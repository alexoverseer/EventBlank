import UIKit

final class DefaultConferenceViewModel: ConferenceViewModel {
    
    var output: ConferenceViewModelOutput?
    var collectionDisplayManager: CollectionDisplayManager?
    var tableDisplayManager: TableDisplayManager?
    var conference: ConferenceViewVModel!
    
    var topics: [TalkViewModel] {
        return conference.topics
    }
    
    var speakers: [SpeakerViewVModel] {
        return conference.people
    }
    
    func conferenceDetails() -> (title: String, description: String?) {
        let title = conference.conference.title
        let description = conference.conference.description
        
        return (title, description)
    }
    
    func onViewDidLoad(_ view: ConferenceView) {
        
        let photoList = conference.resouces.compactMap { $0.local }
        
        output?.setTotalPhotosPagesNumber(pages: photoList.count)
        
        collectionDisplayManager?.updatContent(with: photoList)
        tableDisplayManager?.updatContent(with: topics)
        
        output?.updateTableHeight()
    }
    
    func registerCollection(_ collectionView: UICollectionView) {
        collectionDisplayManager = CollectionDisplayManager(with: collectionView)
        collectionDisplayManager?.delegate = self
    }
    
    func registerTable(_ tableView: UITableView) {
        tableDisplayManager = TableDisplayManager(with: tableView)
        tableDisplayManager?.delegate = self
    }
    
    func changeTableType(selectedType: SelectedConferenceType) {
        tableDisplayManager?.switchTableType(type: selectedType)
        
        switch selectedType {
        case .topics:
            tableDisplayManager?.updatContent(with: topics)
        case .speakers:
            tableDisplayManager?.updatContent(with: speakers)
        }
    }
}

extension DefaultConferenceViewModel: CollectionDisplayManagerDelegate {
    
    func currentPhotoIndex(index: Int) {
        output?.setCurrentPage(page: index)
    }
    
    func openPhotoBrowser(originImage: UIImage?, fromCell: UICollectionViewCell) {
        
        let originalPhotos = conference.resouces.compactMap { $0.local }
                                                .compactMap { UIImage(named: $0) }
        
        output?.openPhotoBrowser(originImage: originImage, images: originalPhotos, cell: fromCell)
    }
}

extension DefaultConferenceViewModel: TableDisplayManagerDelegate {
    
    func didSelectTopic(at index: Int) {
        output?.openTopic(topic: topics[index])
    }
    
    func didSelectSpeaker(at index: Int) {
        output?.openSpeaker(speaker: speakers[index])
    }
}
