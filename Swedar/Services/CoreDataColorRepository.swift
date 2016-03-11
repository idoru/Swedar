import Foundation
import UIKit
import CoreData

class CoreDataColorRepository: ColorRepository {
    static let sharedInstance = CoreDataColorRepository()
    let coreDataManager: CoreDataManager

    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }

    convenience init() {
        self.init(coreDataManager:SQLLiteCoreDataManager())
    }

    var colors: [UIColor] {
        do {
            let storedColors = try self.coreDataManager.managedObjectContext.executeFetchRequest(NSFetchRequest(entityName: "Color")) as! [Color]
            return storedColors.map { (color) -> UIColor in
                return UIColor(red: CGFloat(color.red!), green: CGFloat(color.green!), blue: CGFloat(color.blue!), alpha: 1)
            }
        } catch let error as NSError {
            print("\(error) happened")
        }
        return []
    }

    func addColor(color: UIColor) {
        guard let newColor = NSEntityDescription.insertNewObjectForEntityForName("Color", inManagedObjectContext: self.coreDataManager.managedObjectContext) as? Color else {
            return
        }

        do {
            newColor.red = color.red
            newColor.green = color.green
            newColor.blue = color.blue
            try self.coreDataManager.managedObjectContext.save()
        } catch let error as NSError {
            print("\(error) happened")
        }
    }
}