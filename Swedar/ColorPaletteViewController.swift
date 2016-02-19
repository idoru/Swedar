import UIKit

class ColorPaletteViewController: UICollectionViewController, ColorPickerViewControllerDelegate {
    let colorRepository: ColorRepository

    required init?(coder aDecoder: NSCoder) {
        self.colorRepository = CoreDataColorRepository()
        super.init(coder: aDecoder)
    }

    convenience init() {
        self.init(colorRepository: CoreDataColorRepository())
    }

    init(colorRepository: ColorRepository) {
        self.colorRepository = colorRepository
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier:"kAddCellReuseIdentifier")
    }

    override func viewDidLoad() {
        collectionView?.backgroundColor = UIColor.whiteColor()
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colorRepository.colors.count + 1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("kAddCellReuseIdentifier", forIndexPath: indexPath)
        if (indexPath.row == 0) {
            cell.backgroundColor = UIColor.magentaColor()
        } else if let color = colorRepository.colors[indexPath.row - 1] as? UIColor {
            cell.backgroundColor = color
        }
        return cell
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        presentViewController(ColorPickerViewController(delegate: self), animated: true, completion: nil)
    }

    // MARK: - ColorPickerViewControllerDelegate

    func colorPickerViewControllerDidPickColor(color: UIColor) {
        self.dismissViewControllerAnimated(true, completion: nil)
        self.colorRepository.addColor(color)
        collectionView?.reloadData()
    }
}
