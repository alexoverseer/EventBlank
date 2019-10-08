import Foundation

public protocol TopicViewModelOutput {
    func showError(title: String, message: String)
    func enablePlayerControlls()
    func setVideoThumbnail(url: URL)
    func updateVideoQuality()
}
