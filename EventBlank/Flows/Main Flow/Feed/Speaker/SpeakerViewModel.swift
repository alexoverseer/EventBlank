import Foundation

protocol SpeakerViewModel: class {
    var output: SpeakerViewModelOutput? { get set }
    func onViewDidLoad(_ view: SpeakerView)
}
