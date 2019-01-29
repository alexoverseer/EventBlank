import Foundation

final class DefaultTopicViewModel: TopicViewModel {
    
    var output: TopicViewModelOutput?
    var topic: TalkViewVModel!
    var videoContents: VimeoVideo?
    private var videoExtractor: VimeoVideoExtractor
    
    init(videoExtractor: VimeoVideoExtractor) {
        self.videoExtractor = videoExtractor
    }
    
    func onViewDidLoad(_ view: TopicView) {
        fetchVideoContents()
    }
    
    func fetchVideoContents() {
        videoExtractor.fetchVideoURLFrom(path: topic.video?.url) { [weak self] result in
            switch result {
            case .success(let videoData):
                self?.videoContents = videoData
                self?.prepareVideoPlayer()
            case .failure(let error):
                self?.output?.showError(title: "Error",
                                        message: error.message)
            }
        }
    }
    
    func topicName() -> String {
        return topic.talk.title
    }
    
    func speakerDetails() -> (name: String, title: String, imageURL: URL?) {
        let name = topic.speaker.name
        let title = topic.speaker.title
        let imageURL = URL(string: topic.speaker.photo)
        
        return (name, title, imageURL)
    }
    
    func prepareVideoPlayer() {
        DispatchQueue.main.async { [weak self] in
            self?.output?.enablePlayerControlls()
            guard let thumbnail = self?.videoContents?.thumbnail else { return }
            self?.output?.setVideoThumbnail(url: thumbnail)
            self?.output?.updateVideoQuality()
        }
    }
    
    func getVideoDetails() -> VimeoVideo? {
        return videoContents
    }
    
    func setVideoQuality(quality: String?) {
        videoContents?.changeQuality(to: quality)
        self.output?.updateVideoQuality()
    }
    
    func currentVideoQuality() -> String? {
        return videoContents?.selectedQuality
    }
}
