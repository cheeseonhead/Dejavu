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
    
    func anchorLeftInTop(withLeftPadding leftPadding: CGFloat, topPadding: CGFloat)
    {
        frame = CGRect(x: leftPadding, y: topPadding, width: frame.size.width, height: frame.size.height)
    }
    
    func alignUnderMatchingLeft(_ view: UIView, topPadding: CGFloat)
    {
        let newY = view.frame.origin.y + view.frame.size.height + topPadding
        let oldFrame = frame
        let newFrame = CGRect(x: view.frame.origin.x, y: newY, width: oldFrame.width, height: oldFrame.height)
        frame = newFrame
    }
}
