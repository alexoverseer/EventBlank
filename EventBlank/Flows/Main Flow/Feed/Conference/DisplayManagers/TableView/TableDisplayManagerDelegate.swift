import Foundation

protocol TableDisplayManagerDelegate: class {
    func didSelectTopic(at index: Int)
    func didSelectSpeaker(at index: Int)
}
