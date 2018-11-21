class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    func start() { }
    
    func addDependency(_ coordinator: Coordinator) {
        
        guard !childCoordinators.contains(where: { $0 === coordinator }) else {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        childCoordinators = childCoordinators.filter({ $0 !== coordinator })
    }
}
