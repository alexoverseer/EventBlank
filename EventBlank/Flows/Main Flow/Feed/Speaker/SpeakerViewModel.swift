import Foundation

protocol SpeakerViewModel: class {
    var output: SpeakerViewModelOutput? { get set }
    var talks: [TalkViewModel] { get set }
    var profile: SpeakerViewVModel! { get set }
    
    func onViewDidLoad(_ view: SpeakerView)
    func speakerDetails() -> (name: String, title: String, imageURL: URL?)
}
