import UIKit

protocol FeedModuleFactory {
    func makeFeedListOutput() -> FeedListView
    func makeConferenceOutput(conference:ConferenceViewVModel) -> ConferenceView
    func makePhotoBrowserOutput(model: PhotoBrowserModel) -> Presentable
    func makeTopicOutput(topic:TalkViewModel) -> TopicView
    func makeSpeakerOutput(speaker:SpeakerViewVModel) -> SpeakerView
}
