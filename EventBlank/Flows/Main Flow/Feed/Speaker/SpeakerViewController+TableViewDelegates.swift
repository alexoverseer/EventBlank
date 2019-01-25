import UIKit

extension SpeakerViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.talks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TopicTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let talk = viewModel.talks[indexPath.row]
        cell.configure(with: talk)
        
        return cell
    }
}

extension SpeakerViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        onSelectTopic?(viewModel.talks[indexPath.row])
    }
}
