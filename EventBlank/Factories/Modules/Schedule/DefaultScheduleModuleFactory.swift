import Foundation

final class DefaultScheduleModuleFactory: BaseFactory, ScheduleModuleFactory {
    
    func makeScheduleListOutput() -> ScheduleListView {
        let viewModel = resolver.resolve(ScheduleListViewModel.self)!
        let controller = ScheduleListViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
}
