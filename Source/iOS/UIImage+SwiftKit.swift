import UIKit

/// SwiftKit extensions to the UIImage class
public extension UIImage {
    /// Create a new image that is the result of applying a tint color to this image
    public func tintedImageWithColor(tintColor: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let imageRect = CGRect(origin: CGPointZero, size: self.size)
        
        self.drawInRect(imageRect)
        tintColor.set()
        UIRectFillUsingBlendMode(imageRect, .Color)
        self.drawInRect(imageRect, blendMode: .DestinationIn, alpha: 1)
        
        if let tintedImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return tintedImage
        }
        
        UIGraphicsEndImageContext()
        
        return nil
    }
}
