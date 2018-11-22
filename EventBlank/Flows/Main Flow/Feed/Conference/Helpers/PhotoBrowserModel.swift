import UIKit

struct PhotoBrowserModel {
    let originImage: UIImage?
    let images: [UIImage]?
    let sourceView: UIView
    let index: Int?
    
    init(originImage: UIImage? = nil, images: [UIImage]? = nil, sourceView: UIView, index: Int? = nil) {
        self.originImage = originImage
        self.images = images
        self.sourceView = sourceView
        self.index = index
    }
}
