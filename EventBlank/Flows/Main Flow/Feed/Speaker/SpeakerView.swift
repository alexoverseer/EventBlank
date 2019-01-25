import Foundation

protocol SpeakerView: BaseView {
    var viewModel: SpeakerViewModel! { get set }
    var onSelectTopic: ((TalkViewVModel) -> Void)? { get set }
}
