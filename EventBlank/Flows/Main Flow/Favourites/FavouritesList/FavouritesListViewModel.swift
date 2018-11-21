import Foundation

protocol FavouritesListViewModel: class {
    var output: FavouritesListViewModelOutput? { get set }
    func onViewDidLoad(_ view: FavouritesListView)
}
