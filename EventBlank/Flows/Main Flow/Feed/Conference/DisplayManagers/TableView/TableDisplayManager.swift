import UIKit

final class TableDisplayManager: NSObject, TableDelegatable {
    
    #warning ("Replace String -> ViewModel")
    typealias Item = Any
    
    private var dataSource = [Item]()
    private var tableView: UITableView
    private var cellType = SelectedConferenceType.topics
    
    weak var delegate: TableDisplayManagerDelegate?
    
    init(with tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func switchTableType(type: SelectedConferenceType) {
        self.cellType = type
        reloadData()
    }
    
    func updatContent(with items: [Item]) {
        dataSource = items
        reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataSource.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch cellType {
        case .topics:
            return topicCell(for: indexPath)
        case .speakers:
            return speakerCell(for: indexPath)
        }
    }
    
    private func topicCell(for indexPath: IndexPath) -> UITableViewCell {
        let topicCell: TopicTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        return topicCell
    }
    
    private func speakerCell(for indexPath: IndexPath) -> UITableViewCell {
        let speakerCell: SpeakerTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        return speakerCell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch cellType {
        case .topics:
            delegate?.didSelectTopic(at: indexPath.row)
        case .speakers:
            delegate?.didSelectSpeaker(at: indexPath.row)
        }
    }
}
