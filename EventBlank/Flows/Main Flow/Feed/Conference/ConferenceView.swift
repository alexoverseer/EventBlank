import Foundation

protocol ConferenceView: BaseView {
    var viewModel: ConferenceViewModel! { get set }
    var onShowTopic: (() -> Void)? { get set }
    var onShowSpeaker: (() -> Void)? { get set }
}
