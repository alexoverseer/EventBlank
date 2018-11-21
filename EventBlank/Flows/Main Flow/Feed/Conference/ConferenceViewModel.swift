import UIKit

protocol ConferenceViewModel: class {
    var output: ConferenceViewModelOutput? { get set }
    func onViewDidLoad(_ view: ConferenceView)
    func registerTable(_ tableView: UITableView)
    func registerCollection(_ collectionView: UICollectionView)
}
