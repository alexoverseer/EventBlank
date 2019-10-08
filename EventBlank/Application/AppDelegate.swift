import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var rootController: UINavigationController? {
        return self.window!.rootViewController as? UINavigationController
    }
    
    private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setUpWindow()
        applicationCoordinator.start()
        
        return true
    }
    
    private func setUpWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        window?.makeKeyAndVisible()
    }
    
    private func makeCoordinator() -> Coordinator {
        return ApplicationCoordinator(
            router: RouterImplementation(rootController: rootController!),
            coordinatorFactory: AppEnvironment.coordinatorFactory
        )
    }
}
