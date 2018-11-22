import UIKit

protocol CollectionDelegatable: UICollectionViewDataSource &
                                UICollectionViewDelegate &
                                UICollectionViewDelegateFlowLayout {
    
    associatedtype Item
    
    func reloadData()
    func updatContent(with items: [Item])
}
