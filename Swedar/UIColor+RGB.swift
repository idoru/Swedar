import Foundation
import UIKit

extension UIColor {
    var red: NSNumber {
            var fRed : CGFloat = 0
            var fGreen : CGFloat = 0
            var fBlue : CGFloat = 0
            var fAlpha: CGFloat = 0
            self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
            return fRed;
    }
    var green: NSNumber {
            var fRed : CGFloat = 0
            var fGreen : CGFloat = 0
            var fBlue : CGFloat = 0
            var fAlpha: CGFloat = 0
            self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
            return fGreen;
    }
    var blue: NSNumber {
            var fRed : CGFloat = 0
            var fGreen : CGFloat = 0
            var fBlue : CGFloat = 0
            var fAlpha: CGFloat = 0
            self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha)
            return fBlue;
    }
}