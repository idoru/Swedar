import Cedar
import UIKit
import PivotalCoreKit
import Nimble
@testable import Swedar

class FakeColorPickerViewControllerDelegate: ColorPickerViewControllerDelegate {
    var pickedColor: UIColor?
    func colorPickerViewControllerDidPickColor(color: UIColor) {
        pickedColor = color
    }
}

class ColorPickerViewControllerSpec: CDRSpec {
    override func declareBehaviors() {
        var subject: ColorPickerViewController!
        var fakeDelegate: FakeColorPickerViewControllerDelegate!

        beforeEach {
            fakeDelegate = FakeColorPickerViewControllerDelegate()
            subject = ColorPickerViewController(delegate: fakeDelegate)
            let window = UIWindow(frame: UIScreen.mainScreen().bounds)
            window.rootViewController = subject
            window.makeKeyAndVisible()
            NSRunLoop.currentRunLoop().runUntilDate(NSDate())

            subject.delegate = fakeDelegate
        }

        it("should have a initial color matching the color sliders") {
            expect(subject.view.backgroundColor).to(equal(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)))
        }

        describe("changing the sliders") {
            beforeEach {
                subject.greenSlider.value = 0.0
                subject.blueSlider.value = 0.0
                subject.redSlider.value = 1

                subject.redSlider.sendActionsForControlEvents(.ValueChanged)
            }

            it("should change the background color to reflect the RGB slider values") {
                expect(subject.view.backgroundColor).to(equal(UIColor(red:1.0, green:0.0, blue:0.0, alpha:1.0)))
            }

            describe("when other sliders change") {
                beforeEach {
                    subject.greenSlider.value = 0.75
                    subject.greenSlider.sendActionsForControlEvents(.ValueChanged)
                    subject.blueSlider.value = 0.5
                    subject.blueSlider.sendActionsForControlEvents(.ValueChanged)
                }

                it("should change the background color to reflect the RGB slider values") {
                    expect(subject.view.backgroundColor).to(equal(UIColor(red:1.0, green:0.75, blue:0.5, alpha:1.0)))
                }
            }
        }

        describe("tapping the 'Add Color' button") {
            beforeEach {
                subject.redSlider.value = 1
                subject.greenSlider.value = 0
                subject.blueSlider.value = 0

                subject.redSlider.sendActionsForControlEvents(.ValueChanged)

                subject.addButton.tap()
            }

            it("should tell the delegate that a color has been added") {
               expect(fakeDelegate.pickedColor).to(equal(UIColor(red: 1, green: 0, blue: 0, alpha: 1)))
            }
        }
    }
}
