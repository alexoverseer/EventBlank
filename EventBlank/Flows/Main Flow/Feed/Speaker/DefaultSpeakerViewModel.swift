import Foundation

final class DefaultSpeakerViewModel: SpeakerViewModel {
    
    var output: SpeakerViewModelOutput?
    var talks: [TalkViewModel] = [] {
        didSet {
            output?.reloadData()
        }
    }
    
    var profile: SpeakerViewVModel!
    
    func onViewDidLoad(_ view: SpeakerView) {
        #warning("replace with DI")
        talks = ViewModelBuilder.default.buildTalksViewModel(for: profile)
    }
    
    func speakerDetails() -> (name: String, title: String, imageURL: URL?) {
        let name = profile.name
        let title = profile.title
        let imageURL = URL(string: profile.photo)
        
        return (name, title, imageURL)
    }
}
