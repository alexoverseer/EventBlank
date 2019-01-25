import Foundation
import UIKit

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
    
    func openSpeakerTwitterPage() {
        let twitter = profile.twitterName
        let page = profile.page
        
        if canOpenURL(url: twitter) {
            openURL(url: twitter)
        } else {
            openURL(url: page)
        }
    }
    
    func canOpenURL(url: URL?) -> Bool {
        guard let url = url else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
    
    func openURL(url: URL?) {
        guard let url = url else { return }
        UIApplication.shared.open(url, options: [: ], completionHandler: nil)
    }
}
