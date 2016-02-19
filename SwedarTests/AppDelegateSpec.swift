import Cedar
import Nimble
@testable import Swedar

class AppDelegateSpec: CDRSpec {
    override func declareBehaviors() {
        var subject: AppDelegate!

        beforeEach {
            subject = AppDelegate()
        }

        describe("-application:didFinishLaunchingWithOptions:") {
            beforeEach {
                subject.application(UIApplication.sharedApplication(), didFinishLaunchingWithOptions: nil)
            }

            it("should display a ColorPaletteViewController") {
                expect(subject.window?.rootViewController).to(beAnInstanceOf(ColorPaletteViewController))
            }
        }
    }
}
