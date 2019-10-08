import Foundation

public protocol TopicView: BaseView {
    var viewModel: TopicViewModel! { get set }
    var onShowVideoPlayer: ((VimeoVideo?) -> Void)? { get set }
    var onShowSpeaker: ((SpeakerViewVModel) -> Void)? { get set }
}
