import UIKit

extension UIView
{
    func anchorLeftInCenter(withLeftPadding leftPadding: CGFloat, height: CGFloat, rightPadding: CGFloat)
    {
        guard let supView = superview else {return}
        
        let bigHeight = supView.frame.size.height
        let top = (bigHeight - height) / 2
        
        let bigWidth = supView.frame.size.width
        let width = bigWidth - leftPadding - rightPadding
        
        let final = CGRect(x: leftPadding, y: top, width: width, height: height)
        frame = final
    }
}
