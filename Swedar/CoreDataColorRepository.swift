import Foundation
import UIKit

class CoreDataColorRepository: ColorRepository {
    static let sharedInstance = CoreDataColorRepository()

    var colors: [UIColor] = [ ]

    func save() {
    }

    func addColor(color: UIColor) {
        colors.append(color)
    }
}