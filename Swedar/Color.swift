import Foundation
import UIKit

protocol Color {
    var red: NSNumber { get }
    var green: NSNumber { get }
    var blue: NSNumber { get }
}

extension UIColor: Color {
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