import Cedar
import UIKit
import PivotalCoreKit
import Nimble
@testable import Swedar

class CoreDataColorRepositorySpec: CDRSpec {
    override func declareBehaviors() {
        var repository: CoreDataColorRepository!
        var cdm: CoreDataManager!

        beforeEach {
            cdm = InMemoryCoreDataManager()
            repository = CoreDataColorRepository(coreDataManager: cdm)
        }

        describe("+sharedInstance") {
            it("should return the same instance") {
                expect(CoreDataColorRepository.sharedInstance).to(beIdenticalTo(CoreDataColorRepository.sharedInstance))
            }
        }

        describe("-addColor:") {
            let color1 = UIColor.redColor()
            let color2 = UIColor.greenColor()

            beforeEach {
                repository.addColor(color1)
                repository.addColor(color2)
            }

            it("should add the colors to the list") {
                expect(repository.colors).to(equal([ color1, color2 ]))
            }

            it("should persist the colors beyond this instances lifecycle") {
                expect(CoreDataColorRepository(coreDataManager: cdm).colors).to(equal([ color1, color2 ]))
            }
        }
    }
}
