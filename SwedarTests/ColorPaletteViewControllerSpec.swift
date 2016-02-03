import Cedar
import UIKit
import PivotalCoreKit
import Nimble
@testable import Swedar

class ColorPaletteViewControllerSpec: CDRSpec {
    override func declareBehaviors() {
        var controller: ColorPaletteViewController!

        beforeEach {
            controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ColorPaletteViewController") as! ColorPaletteViewController
            let window = UIWindow(frame: UIScreen.mainScreen().bounds)
            window.rootViewController = controller
            window.makeKeyAndVisible()
            NSRunLoop.currentRunLoop().runUntilDate(NSDate())
        }

        describe("tapping the add cell") {
            beforeEach {
                controller.collectionView?.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))?.tap()
            }

            it("should present a ColorPickerViewController") {
                expect(controller.presentedViewController).to(beAnInstanceOf(ColorPickerViewController))
            }
        }
    }
}
