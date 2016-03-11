import UIKit

protocol ColorRepository {
    var colors: [UIColor] { get }
    func addColor(color: UIColor)
}