import Foundation
import RealmSwift
import UIKit

class RealmColorRepository: ColorRepository {
    static var sharedInstance: RealmColorRepository? = {
        do {
            return try RealmColorRepository()
        } catch { }
        return nil
    }()

    let realm: Realm

    init(realm: Realm) {
        self.realm = realm
    }

    convenience init() throws {
        self.init(realm: try Realm())
    }

    var colors: [UIColor] {
        let storedColors = realm.objects(RealmColor)
        return storedColors.map { (color) -> UIColor in
            return UIColor(red: CGFloat(color.red), green: CGFloat(color.green), blue: CGFloat(color.blue), alpha: 1)
        }
    }

    func addColor(color: UIColor) {
        let realmColor = RealmColor()
        realmColor.red = color.red
        realmColor.green = color.green
        realmColor.blue = color.blue
        try! realm.write {
            realm.add(realmColor)
        }
    }
}