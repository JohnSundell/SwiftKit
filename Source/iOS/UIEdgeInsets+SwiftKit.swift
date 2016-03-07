import UIKit

/// SwiftKit-extensions to UIEdgeInsets
public extension UIEdgeInsets {
    /// Initialize an instance with a value for the horizontal/vertical insets
    public init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}
