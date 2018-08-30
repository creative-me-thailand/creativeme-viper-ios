import UIKit
import Foundation

class LoginViewController: UIViewController, LoginViewProtocol {
	var presenter: LoginPresenterProtocol?
	var loginDisplayData: LoginDisplayData?
	@IBOutlet var digitButton: [UIButton] = []
	@IBOutlet weak var keyboardPasscode: PasscodeKeyboard!
	@IBOutlet weak var pinView: PinStyle!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter?.getColorGradientArray()
		keyboardPasscode.delegate = self

	}
	
	@IBAction func getPasscode(_ sender: UIButton) {
		let number = sender.tag
		presenter?.getPasscode(passcode: number)
	}
	
	
	func showColorArray(viewModel: LoginDisplayData) {
		self.loginDisplayData = viewModel
		pinView.arrayOfColor = self.loginDisplayData?.colorGradient?.arrayOfColor
	}
	func showColorPasscode() {
		
	}
}

extension LoginViewController: PasscodeKeyboardDelagate {
	func didSelectOnKeyBoard(key: PasscodeKeyboardKey) {
		if key != .delete && key != .forgot {
			pinView.getPasscode(passcode: key.rawValue)
		} else {
			pinView.removePasscode()
		}
	}

}
extension LoginViewController: PinStyleDelegate {
	func countPasscode(count: Int) {
		print(count)
	}
	
	func didRemovePasscode(count: Int) {
		print(count)
	}
	
	func didRemoveAllPasscode(count: Int) {
		print(count)
	}
	

}
