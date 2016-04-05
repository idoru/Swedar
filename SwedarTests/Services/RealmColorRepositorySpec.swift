import Cedar
import UIKit
import Nimble
import RealmSwift
@testable import Swedar

class RealmColorRepositorySpec: CDRSpec {
    override func declareBehaviors() {
        var repository: RealmColorRepository!
        var realm: Realm!

        beforeEach {
            realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "MyInMemoryRealm\(rand())"))
            repository = RealmColorRepository(realm: realm)
        }

        describe("+sharedInstance") {
            it("should return the same instance") {
                expect(RealmColorRepository.sharedInstance).to(beIdenticalTo(RealmColorRepository.sharedInstance))
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
                expect(RealmColorRepository(realm: realm).colors).to(equal([ color1, color2 ]))
            }
        }
    }
}
