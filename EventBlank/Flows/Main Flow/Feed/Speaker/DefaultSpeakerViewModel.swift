import Foundation

final class DefaultSpeakerViewModel: SpeakerViewModel {
    
    var output: SpeakerViewModelOutput?
    var talks: [TalkViewModel] = [] {
        didSet {
            
        }
    }
    
    var profile: SpeakerViewVModel!
    
    func onViewDidLoad(_ view: SpeakerView) {
        talks = profile?.topics ?? []
    }
}
