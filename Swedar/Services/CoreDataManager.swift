import CoreData

protocol CoreDataManager {
    var managedObjectContext: NSManagedObjectContext { get }
}