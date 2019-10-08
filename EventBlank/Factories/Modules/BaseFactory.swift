import Foundation
import SKPhotoBrowser

public class BaseFactory: NSObject {
    
    public func makePhotoBrowserOutput(model: PhotoBrowserModel) -> Presentable {
        
        let originImage = model.originImage ?? UIImage()
        let images = model.images?.map { SKPhoto.photoWithImage($0) }
        let index = model.index ?? 0
        let browser = SKPhotoBrowser(photos: images ?? [SKPhoto.photoWithImage(originImage)],
                                     initialPageIndex: index)

        return browser
    }
}
