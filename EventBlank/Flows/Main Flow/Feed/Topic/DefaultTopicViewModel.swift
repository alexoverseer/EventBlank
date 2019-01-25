import Foundation

final class DefaultTopicViewModel: TopicViewModel {
    
    var output: TopicViewModelOutput?
    var topic: TalkViewVModel!
    
    func onViewDidLoad(_ view: TopicView) {
        
    }
    
    func topicName() -> String {
        return topic.talk.title
    }
    
    func speakerDetails() -> (name: String, title: String, imageURL: URL?) {
        let name = topic.speaker.name
        let title = topic.speaker.title
        let imageURL = URL(string: topic.speaker.photo)
        
        return (name, title, imageURL)
    }
}
