import UIKit
import Foundation

protocol PinStyleDelegate: class {
	func countPasscode(count: Int)
	func didRemovePasscode(count: Int)
	func didRemoveAllPasscode(count: Int)
}
