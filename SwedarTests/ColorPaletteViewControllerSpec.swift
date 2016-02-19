import Cedar
import UIKit
import PivotalCoreKit
import Nimble
@testable import Swedar

class FakeColorRepository: ColorRepository {
    var colors: [Color] = [ UIColor.purpleColor(), UIColor.greenColor(), UIColor.orangeColor() ]

    func save() {
    }

    func addColor(color: Color) {
        colors.append(color)
    }
}

class ColorPaletteViewControllerSpec: CDRSpec {
    override func declareBehaviors() {
        var controller: ColorPaletteViewController!
        var fakeRepository: ColorRepository!

        beforeEach {
            fakeRepository = FakeColorRepository()
            controller = ColorPaletteViewController(colorRepository: fakeRepository)
            let window = UIWindow(frame: UIScreen.mainScreen().bounds)
            window.rootViewController = controller
            window.makeKeyAndVisible()
            NSRunLoop.currentRunLoop().runUntilDate(NSDate())
        }

        it("should display all the colors from the repository") {
            expect(controller.collectionView?.visibleCells()[1].backgroundColor).to(equal(UIColor.purpleColor()))
            expect(controller.collectionView?.visibleCells()[2].backgroundColor).to(equal(UIColor.greenColor()))
            expect(controller.collectionView?.visibleCells()[3].backgroundColor).to(equal(UIColor.orangeColor()))
        }

        describe("tapping the add cell") {
            beforeEach {
                controller.collectionView?.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))?.tap()
            }

            it("should present a ColorPickerViewController") {
                expect(controller.presentedViewController).to(beAnInstanceOf(ColorPickerViewController))
            }

            describe("tapping 'Add' button") {
                beforeEach {
                    let colorPickerVC = controller.presentedViewController as! ColorPickerViewController
                    colorPickerVC.delegate?.colorPickerViewControllerDidPickColor(UIColor.redColor())
                }

                it("should dismiss the presented view controller") {
                    expect(controller.presentedViewController).to(beNil())
                }

                it("should add a cell with the picked color") {
                    expect(controller.collectionView?.cellForItemAtIndexPath(NSIndexPath(forItem: 4, inSection: 0))?.backgroundColor).toEventually(equal(UIColor.redColor()))
                }

                describe("adding another color") {
                    beforeEach {
                        NSRunLoop.currentRunLoop().runUntilDate(NSDate())
                        controller.collectionView?.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))?.tap()

                        let colorPickerVC = controller.presentedViewController as! ColorPickerViewController
                        colorPickerVC.delegate?.colorPickerViewControllerDidPickColor(UIColor.blueColor())
                    }

                    it("should add yet another cell with the next picked color") {
                        expect(controller.collectionView?.cellForItemAtIndexPath(NSIndexPath(forItem: 5, inSection: 0))?.backgroundColor).toEventually(equal(UIColor.blueColor()))
                    }

                    describe("relaunching the app") {

                    }
                }
            }
        }
    }
}
