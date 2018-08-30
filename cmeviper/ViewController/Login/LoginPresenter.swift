import UIKit

class LoginPresenter: LoginPresenterProtocol, LoginInteractorOutputProtocol {
	let blueColor: String = "#48AAE5"
	let greenColor: String = "#D9DE4F"
	let countColor = 4
	let alpha: Int = 1
	weak private var view: LoginViewProtocol?
	private let router: LoginWireframeProtocol
	var interactor: LoginInteractorInputProtocol?
	var arrayOfColors: ArrayOfColors?
	var loginDisplayData: LoginDisplayData?
	var countPasscode: Int = 0
	
	init(interface: LoginViewProtocol, interactor: LoginInteractorInputProtocol?, router: LoginWireframeProtocol, arrayOfColors: ArrayOfColors, loginDisplayData: LoginDisplayData?) {
		
		self.view = interface
		self.interactor = interactor
		self.router = router
		self.arrayOfColors = arrayOfColors
		self.loginDisplayData = loginDisplayData
	}
	
}
extension LoginPresenter {
	func getPasscode(passcode: Int) {
		countPasscode += 1
	}
}
extension LoginPresenter {
	
	func getColorGradientArray() {
		let request = RequestColorArray(colorStart: greenColor,
										colorEnd: blueColor,
										colorCount: countColor)
		if let hex = arrayOfColors?.generateColor(request: request) {
			self.convertHexToUIColor(hex: hex)
		}
		
	}
	
	func convertHexToUIColor(hex: [String]) {
		var colorArray: [UIColor] = []
		
		hex.forEach { (hex) in
			let color = arrayOfColors?.colorWithHexString(hex: hex, alpha: CGFloat(alpha))
			colorArray.append(color!)
		}
		let colorGradient = ColorGradient(arrayOfColor: colorArray)
		let viewModel = LoginDisplayData(colorGradient: colorGradient)
		view?.showColorArray(viewModel: viewModel)
	}
	
}
