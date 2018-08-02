
import UIKit

private func LOG(_ message: String)
{
    NSLog("CharactersItemView \(message)")
}

class CharactersItemView: UIView
{

    // MARK: - IMAGE

    var image: UIImage?
    {
        get
        {
            return self.imageView.image
        }
        set
        {
            self.imageView.image = newValue
        }
    }

    @IBOutlet private var imageView: UIImageView!

}

