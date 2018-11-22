import Foundation

protocol TopicViewModel: class {
    var output: TopicViewModelOutput? { get set }
    func onViewDidLoad(_ view: TopicView)
}
