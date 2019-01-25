import UIKit

protocol ConferenceView: BaseView {
    var viewModel: ConferenceViewModel! { get set }
    var onShowTopic: ((TalkViewVModel) -> Void)? { get set }
    var onShowSpeaker: ((SpeakerViewVModel) -> Void)? { get set }
    var onShowPhotoBrowser: ((PhotoBrowserModel) -> Void)? { get set }
}
