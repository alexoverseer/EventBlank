import Foundation

final class DefaultSpeakersModuleFactory: BaseFactory, SpeakersModuleFactory {
    
    func makeSpeakersListOutput() -> SpeakersListView {
        let viewModel = resolver.resolve(SpeakersListViewModel.self)!
        let controller = SpeakersListViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
}
