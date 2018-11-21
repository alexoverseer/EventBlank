import Foundation

protocol ScheduleListViewModel: class {
    var output: ScheduleListViewModelOutput? { get set }
    func onViewDidLoad(_ view: ScheduleListView)
}
