import Foundation

protocol TopicViewModelOutput {
    func showError(title: String, message: String)
    func enablePlayerControlls()
    func setVideoThumbnail(url: URL)
}
