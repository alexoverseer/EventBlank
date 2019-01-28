import Foundation

protocol TopicView: BaseView {
    var viewModel: TopicViewModel! { get set }
    var onShowVideoPlayer: ((VimeoVideo?) -> Void)? { get set }
}
