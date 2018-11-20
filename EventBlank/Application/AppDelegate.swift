import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var rootController: UINavigationController? {
        return self.window!.rootViewController as? UINavigationController
    }
    
    var assembler: AppAssembler? {
        return DefaultAppAssembler.shared
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setUpWindow()
        
        return true
    }
    
    private func setUpWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        window?.makeKeyAndVisible()
    }
}
