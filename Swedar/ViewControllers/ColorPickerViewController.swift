import UIKit

protocol ColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidPickColor(color: UIColor)
}

class ColorPickerViewController: UIViewController {
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var addButton: UIButton!

    var delegate:ColorPickerViewControllerDelegate?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(delegate: ColorPickerViewControllerDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }

    override func viewDidLoad() {
        self.view.backgroundColor = self.currentColor()
    }

    @IBAction func addButtonTapped(sender: AnyObject) {
        self.delegate?.colorPickerViewControllerDidPickColor(self.currentColor())
    }

    @IBAction func sliderValueChanged(sender: AnyObject) {
        self.view.backgroundColor = self.currentColor()
    }

    private
    func currentColor() -> UIColor {
        return UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
}