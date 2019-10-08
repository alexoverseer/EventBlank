import Foundation

public protocol FavouritesListViewModel: class {
    var output: FavouritesListViewModelOutput? { get set }
    func onViewDidLoad(_ view: FavouritesListView)
}
