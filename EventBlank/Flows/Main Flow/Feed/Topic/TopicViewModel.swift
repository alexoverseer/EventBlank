import Foundation

protocol TopicViewModel: class {
    var output: TopicViewModelOutput? { get set }
    var topic: TalkViewModel! { get set }
    
    func onViewDidLoad(_ view: TopicView)
    func topicName() -> String
    func speakerDetails() -> (name: String, title: String, imageURL: URL?)
}
