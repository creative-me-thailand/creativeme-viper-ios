import UIKit
import Fabric
import Crashlytics


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self])
		window = ApplicationRouter.createWindow()
		window?.becomeKey()
		
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {}

	func applicationDidEnterBackground(_ application: UIApplication) {}

	func applicationWillEnterForeground(_ application: UIApplication) {}

	func applicationDidBecomeActive(_ application: UIApplication) {}

	func applicationWillTerminate(_ application: UIApplication) {}


}

struct ApplicationRouter {
	
	static func createWindow() -> UIWindow {
		let window = UIWindow()
		window.rootViewController = createModule()
		
		return window
	}
		
	static func createModule() -> UIViewController {
		let rootViewController = LoginRouter.createModule()
		let rootNavigationController = UINavigationController(rootViewController: rootViewController)
		return rootNavigationController
	}
	
}
