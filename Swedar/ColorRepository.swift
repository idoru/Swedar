import Foundation

protocol ColorRepository {
    func save()
    var colors: [Color] { get }
    func addColor(color: Color)
}