import UIKit

final class CollectionDisplayManager: NSObject, CollectionDelegatable {
    
    #warning ("Replace String -> ViewModel")
    typealias Item = String
    
    private var dataSource = [Item]()
    private var collectionView: UICollectionView
    
    weak var delegate: CollectionDisplayManagerDelegate?
    
    init(with collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func reloadData() {
        self.collectionView.reloadData()
    }
    
    func updatContent(with items: [Item]) {
        self.dataSource = items
        reloadData()
    }
    
    // MARK: - UICollectionViewDataSource
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.dataSource.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PhotoCollectionViewCell else { return }
        let originImage = cell.photoImageView.image
        
        delegate?.openPhotoBrowser(originImage: originImage, fromCell: cell)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView is UICollectionView else { return }
        sendCurentIndex()
    }
    
    func sendCurentIndex() {
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint)
        guard let index = visibleIndexPath?.row else { return }
        delegate?.currentPhotoIndex(index: index)
    }
}
