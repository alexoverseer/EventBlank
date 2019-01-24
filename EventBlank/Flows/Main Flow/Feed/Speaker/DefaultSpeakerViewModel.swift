import Foundation

final class DefaultSpeakerViewModel: SpeakerViewModel {
    
    var output: SpeakerViewModelOutput?
    var talks: [TalkViewModel] = [] {
        didSet {
            output?.reloadData()
        }
    }
    
    var profile: SpeakerViewVModel!
    var builder: ViewModelBuilder
    
    init(builder: ViewModelBuilder) {
        self.builder = builder
    }
    
    func onViewDidLoad(_ view: SpeakerView) {
        talks = builder.buildTalksViewModel(for: profile)
    }
    
    func speakerDetails() -> (name: String, title: String, imageURL: URL?) {
        let name = profile.name
        let title = profile.title
        let imageURL = URL(string: profile.photo)
        
        return (name, title, imageURL)
    }
}
