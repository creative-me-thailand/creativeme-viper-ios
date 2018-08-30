import UIKit
import Foundation

//MARK: Wireframe -
protocol LoginWireframeProtocol: class {
	func routeToMainPage()
}
//MARK: Presenter -
protocol LoginPresenterProtocol: class {

    var interactor: LoginInteractorInputProtocol? { get set }
	func getColorGradientArray()
	func getPasscode(passcode: Int)
}

//MARK: Interactor -
protocol LoginInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol LoginInteractorInputProtocol: class {

    var presenter: LoginInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol LoginViewProtocol: class {
	
    var presenter: LoginPresenterProtocol?  { get set }
	func showColorArray(viewModel: LoginDisplayData)
	func showColorPasscode()
	
}
