import Foundation

protocol FeedModuleFactory {
    func makeFeedListOutput() -> FeedListView
    func makeConferenceOutput() -> ConferenceView
}
