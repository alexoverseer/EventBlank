import UIKit

struct SpeakerImageHelper {
    
    static func setupSpeakerImage(image: UIImageView) {
        image.layer.borderWidth = 3
        image.layer.borderColor = Stylesheet.Color.appMagenta.cgColor
        image.layer.cornerRadius = image.frame.width / 2
    }
}
