import Foundation

public protocol SpeakerViewModel: class {
    var output: SpeakerViewModelOutput? { get set }
    var talks: [TalkViewVModel] { get set }
    var profile: SpeakerViewVModel! { get set }
    var builder: ViewModelBuilder { get set }
    
    func onViewDidLoad(_ view: SpeakerView)
    func speakerDetails() -> (name: String, title: String, imageURL: URL?)
    func openSpeakerTwitterPage()
}
