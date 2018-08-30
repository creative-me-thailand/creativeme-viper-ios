import UIKit
import Foundation

enum PasscodeKeyboardKey: Int {
	case one = 1
	case two = 2
	case three = 3
	case four = 4
	case five = 5
	case six = 6
	case seven = 7
	case eight = 8
	case nine = 9
	case zero = 0
	case forgot = 10
	case delete = 11
}

protocol PasscodeKeyboardDelagate: class {
	func didSelectOnKeyBoard(key: PasscodeKeyboardKey)
}
