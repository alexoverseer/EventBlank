import Foundation

protocol SpeakerViewModel: class {
    var output: SpeakerViewModelOutput? { get set }
    var talks: [TalkViewModel] { get set }
    var profile: SpeakerViewVModel! { get set }
    var builder: ViewModelBuilder { get set }
    
    func onViewDidLoad(_ view: SpeakerView)
    func speakerDetails() -> (name: String, title: String, imageURL: URL?)
    func openSpeakerTwitterPage()
}
