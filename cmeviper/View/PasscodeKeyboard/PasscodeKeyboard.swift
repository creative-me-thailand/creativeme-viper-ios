import UIKit
import Foundation

@IBDesignable
class PasscodeKeyboard: UIView {
	@IBOutlet var digitButton: [UIButton] = []
	
	private var view: UIView!
	var delegate: PasscodeKeyboardDelagate?

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
		let nib = UINib(nibName: "PasscodeKeyboardView", bundle: Bundle.main)
		let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
		return view
	}

	@IBAction func getPasscode(_ sender: UIButton) {
		let number = sender.tag
		if let select = PasscodeKeyboardKey(rawValue: number) {
			delegate?.didSelectOnKeyBoard(key: select)
		}

	}
	
}
