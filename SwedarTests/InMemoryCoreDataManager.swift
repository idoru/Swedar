import CoreData
@testable import Swedar

class InMemoryCoreDataManager: SQLLiteCoreDataManager {
    convenience init() {
        self.init(storeType:NSInMemoryStoreType)
    }
}
