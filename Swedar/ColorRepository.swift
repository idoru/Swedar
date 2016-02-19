import UIKit

protocol ColorRepository {
    func save()
    var colors: [UIColor] { get }
    func addColor(color: UIColor)
}