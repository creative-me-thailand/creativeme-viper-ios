import UIKit

class LoginRouter: LoginWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
		guard let view = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController() as? LoginViewController else {
			fatalError("Missing Login ViewController")
		}
		
        let interactor = LoginInteractor()
        let router = LoginRouter()
		let arrayOfColors = ArrayOfColors()
		let loginDisplayData = LoginDisplayData(colorGradient: nil)
		
		let presenter = LoginPresenter(interface: view, interactor: interactor, router: router, arrayOfColors: arrayOfColors, loginDisplayData : loginDisplayData)

		view.presenter = presenter
		view.loginDisplayData = loginDisplayData
        interactor.presenter = presenter
        router.viewController = view

		return view
    }
	
	func routeToMainPage() {
		let vc = UIViewController()
		viewController?.navigationController?.pushViewController(vc, animated: true)
	}
	
}
