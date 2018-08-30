import UIKit
struct RequestColorArray {
	var colorStart: String
	var colorEnd: String
	var colorCount: Int
}
class ArrayOfColors {
	
	func generateColor(request: RequestColorArray) -> [String] {
		
		var start = hexStringToColor(hex: request.colorStart, alpha: 1)
		var end  = hexStringToColor(hex: request.colorEnd, alpha: 1)

		let len = request.colorCount
		var alpha = 0.0
		var saida = [String]()
		
		for _ in 0...len - 1 {
			var c = [Int:Double]()
			alpha += (1.0 / Double(len))
			
			c[0] = (start![0])! * alpha + (1 - alpha) * (end![0])!
			c[1] = (start![1])! * alpha + (1 - alpha) * (end![1])!
			c[2] = (start![2])! * alpha + (1 - alpha) * (end![2])!
			saida.append(convertToHex(rgb: c))
		}
		
		return saida
	}
	
	private func convertToHex(rgb: [Int:Double]) -> String {
		let color = UIColor(red: CGFloat(rgb[0]!), green: CGFloat(rgb[1]!), blue: CGFloat(rgb[2]!), alpha: 1)
		let hexString = color.toHexString()
		return hexString
	}
	
	private func hexStringToColor(hex:String, alpha: CGFloat) -> [Int: Double]? {
		var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
		
		if (cString.hasPrefix("#")) {
			cString = (cString as NSString).substring(from: 1)
		}
		
		let rString = (cString as NSString).substring(to: 2)
		let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
		let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
		
		var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
		Scanner(string: rString).scanHexInt32(&r)
		Scanner(string: gString).scanHexInt32(&g)
		Scanner(string: bString).scanHexInt32(&b)
		var color = [Int: Double]()
		color[0] = Double(CGFloat(r)) / 255.0
		color[1] = Double(CGFloat(g)) / 255.0
		color[2] = Double(CGFloat(b)) / 255.0
		
		return color
	}
	
	func colorWithHexString(hex: String, alpha: CGFloat) -> UIColor {
		var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
		
		if (cString.hasPrefix("#")) {
			cString = (cString as NSString).substring(from: 1)
		}
		
		let rString = (cString as NSString).substring(to: 2)
		let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
		let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
		
		var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
		Scanner(string: rString).scanHexInt32(&r)
		Scanner(string: gString).scanHexInt32(&g)
		Scanner(string: bString).scanHexInt32(&b)
		
		
		return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
	}
}
