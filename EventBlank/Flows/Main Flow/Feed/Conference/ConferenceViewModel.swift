import UIKit

public protocol ConferenceViewModel: class {
    var output: ConferenceViewModelOutput? { get set }
    var conference: ConferenceViewVModel! { get set }
    
    func onViewDidLoad(_ view: ConferenceView)
    func registerTable(_ tableView: UITableView)
    func registerCollection(_ collectionView: UICollectionView)
    func changeTableType(selectedType: SelectedConferenceType)
    func conferenceDetails() -> (title: String, description: String?)
}
