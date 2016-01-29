import Cedar
import Nimble

@testable import Swedar

class AppDelegateSpec: CDRSpec {
    override func declareBehaviors() {
        describe("AppDelegate") {
            var delegate: AppDelegate!
            var application: UIApplication!
            
            describe("application:didFinishLaunchingWithOptions:") {
                beforeEach {
                    delegate = AppDelegate()
                    application = UIApplication.sharedApplication()
                    delegate.application(application, didFinishLaunchingWithOptions: nil)
                }
                
                it("displays a ColorPaletteViewController", {
                    expect(delegate.window?.rootViewController).to(beAKindOf(ColorPaletteViewController))
                })
                
                it("should make the window the key window") {
                    expect(delegate.window?.keyWindow).to(beTruthy())
                }
            }
        }
    }
}
