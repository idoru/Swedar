import Foundation
import UIKit

class CoreDataColorRepository: ColorRepository {
    var colors: [Color] = [ ]

    func save() {
    }

    func addColor(color: Color) {
        colors.append(color)
    }
}