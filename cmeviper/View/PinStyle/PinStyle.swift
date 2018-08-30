import UIKit
import Foundation

@IBDesignable
class PinStyle: UIView {
	
	@IBOutlet var pin: [UIView] = []
	var defaultPin = 3
	var getPasscode: String = ""
	private var view: UIView!
	var arrayOfColor: [UIColor]?
	var delegate: PinStyleDelegate?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		xibSetup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		xibSetup()
	}
	
	private func xibSetup() {
		view = loadViewFromNib()
		view.frame = bounds
		view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
		addSubview(view)
	}
	
	private func loadViewFromNib() -> UIView {
		let nib = UINib(nibName: "PinStyleView", bundle: Bundle.main)
		let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
		return view
	}
	
	private func updatePasscodeView() {
		for viewIndex in 0...defaultPin {
			if viewIndex < getPasscode.count {
				pin[viewIndex].backgroundColor = arrayOfColor?[viewIndex]
			} else {
				pin[viewIndex].backgroundColor = UIColor.lightGray
			}
		}
	}
	func getPasscode(passcode: Int) {
		guard getPasscode.count != 4 else {
			self.clearPasscode()
			return
		}
		getPasscode = getPasscode + String(passcode)
		updatePasscodeView()
	}
	func removePasscode() {
		guard getPasscode.count > 0 else {
			return
		}
		getPasscode.removeLast()
		updatePasscodeView()
		delegate?.countPasscode(count: getPasscode.count)
	}
	func clearPasscode() {
		guard getPasscode.count > 0 else {
			return
		}
		getPasscode.removeAll()
		updatePasscodeView()
		delegate?.countPasscode(count: getPasscode.count)
	}
	
	
}
