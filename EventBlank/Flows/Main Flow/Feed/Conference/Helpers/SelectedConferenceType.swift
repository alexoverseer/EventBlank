import Foundation

enum SelectedConferenceType: Int {
    case topics
    case speakers
    
    static func current(rawValue: Int) -> SelectedConferenceType {
        return SelectedConferenceType(rawValue: rawValue) ?? .topics
    }
}
