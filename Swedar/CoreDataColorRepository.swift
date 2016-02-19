import Foundation
import UIKit

class CoreDataColorRepository: ColorRepository {
    var colors: [UIColor] = [ ]

    func save() {
    }

    func addColor(color: UIColor) {
        colors.append(color)
    }
}