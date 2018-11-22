import UIKit

protocol FeedModuleFactory {
    func makeFeedListOutput() -> FeedListView
    func makeConferenceOutput() -> ConferenceView
    func makePhotoBrowserOutput(model: PhotoBrowserModel) -> Presentable
    func makeTopicOutput() -> TopicView
    func makeSpeakerOutput() -> SpeakerView
}
