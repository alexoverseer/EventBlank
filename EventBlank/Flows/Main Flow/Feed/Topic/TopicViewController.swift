import UIKit
import AVFoundation
import WebKit

class TopicViewController: UIViewController, TopicView {

    var viewModel: TopicViewModel!
    
    @IBOutlet weak var vimeoPlayerBaseView: UIView!
    
    @IBOutlet weak var testWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onViewDidLoad(self)
        setupUI()
    }
    let player = RegularPlayer()
    private func setupUI() {
        #warning ("replace with topic title")
        navigationItem.title = "Topic #1"
        // swiftlint:disable line_length
//        let embedHTML="<html><head><style type=\"text/css\">body {background-color: transparent;color: black;}</style><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=yes\"/></head><body style=\"margin:0\"><div><iframe src=\"//player.vimeo.com/video/139785390?autoplay=1&amp;title=1&amp;byline=1&amp;portrait=0\" width=\"640\" height=\"360\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div></body></html>"
        // swiftlint:enable line_length
        //let url: NSURL = NSURL(string: "https://")!
//        testWebView.loadHTMLString(embedHTML as String, baseURL:url as URL)
//        testWebView.contentMode = UIView.ContentMode.scaleAspectFit
//
    
        player.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        player.view.frame = vimeoPlayerBaseView.bounds
        player.fillMode = .fill
        player.delegate = self
        vimeoPlayerBaseView.addSubview(player.view)
        player.set(AVURLAsset(url: URL(string: "https://vimeo.com/292786900")!))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.player.play()
        }
    }
}

extension  TopicViewController: PlayerDelegate {
    
    func playerDidUpdateState(player: Player, previousState: PlayerState) {
        
    }
    
    func playerDidUpdatePlaying(player: Player) {
        
    }
    
    func playerDidUpdateTime(player: Player) {
        
    }
    
    func playerDidUpdateBufferedTime(player: Player) {
        
    }
}

extension TopicViewController: TopicViewModelOutput {
    
}
