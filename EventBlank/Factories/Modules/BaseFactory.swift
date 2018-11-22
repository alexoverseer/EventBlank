import Foundation
import Swinject
import SKPhotoBrowser

class BaseFactory {
    
    internal let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func makePhotoBrowserOutput(model: PhotoBrowserModel) -> Presentable {
        
        let originImage = model.originImage ?? UIImage()
        let images = model.images?.map { SKPhoto.photoWithImage($0) }
        let browser = SKPhotoBrowser(originImage: originImage,
                                     photos: images ?? [SKPhoto.photoWithImage(originImage)],
                                     animatedFromView: model.sourceView)
        if let index = model.index {
            browser.initializePageIndex(index)
        }
        
        return browser
    }
}
