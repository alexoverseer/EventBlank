import Foundation

protocol SpeakerView: BaseView {
    var viewModel: SpeakerViewModel! { get set }
    var onSelectTopic: ((TalkViewModel) -> Void)? { get set }
}
