import UIKit

/// SwiftKit extensions to the UIImageView class
public extension UIImageView {
    /// Convenience initializer, create a new image view from an image with a name
    public convenience init(imageNamed imageName: String) {
        self.init(image: UIImage(named: imageName))
    }
}
