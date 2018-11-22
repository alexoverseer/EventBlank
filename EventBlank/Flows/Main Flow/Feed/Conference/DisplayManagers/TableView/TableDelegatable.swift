import UIKit

protocol TableDelegatable: UITableViewDataSource & UITableViewDelegate {
    
    associatedtype Item
    
    func reloadData()
    func switchTableType(type: SelectedConferenceType)
    func updatContent(with items: [Item])
}
