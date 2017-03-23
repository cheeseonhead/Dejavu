import UIKit

extension UIColor {
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        let ctx = UIGraphicsGetCurrentContext()
        self.setFill()
        ctx!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

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
    
    func anchorLeftInTop(withLeftPadding leftPadding: CGFloat, topPadding: CGFloat, fillingWidthWithRightPadding rightPadding:CGFloat)
    {
        guard let supView = superview else {return}
        let width = supView.bounds.size.width - leftPadding - rightPadding
        
        frame = CGRect(x: leftPadding, y: topPadding, width: width, height: frame.size.height)
    }
    
    func alignUnderMatchingLeft(_ view: UIView, topPadding: CGFloat)
    {
        let newY = view.frame.origin.y + view.frame.size.height + topPadding
        let oldFrame = frame
        let newFrame = CGRect(x: view.frame.origin.x, y: newY, width: oldFrame.width, height: oldFrame.height)
        frame = newFrame
    }
    
    func alignUnderMatchingLeft(_ view: UIView, topPadding: CGFloat, fillingHeightWithBottomPadding bottomPadding: CGFloat, fillingWidthWithRightPadding rightPadding: CGFloat)
    {
        guard let supView = superview else {return}
        
        let newY = view.frame.origin.y + view.frame.size.height + topPadding
        let newHeight = supView.frame.size.height - newY - bottomPadding
        let newWidth = supView.frame.size.width - view.frame.origin.x - rightPadding
        frame = CGRect(x: view.frame.origin.x, y: newY, width: newWidth, height: newHeight)
    }
    
    func anchorRightInCenter(withRightPadding rightPadding: CGFloat, height: CGFloat, width: CGFloat)
    {
        guard let supView = superview else {return}
        
        let newY = (supView.frame.size.height - height) / 2
        let newX = supView.frame.size.width - rightPadding - width
        
        frame = CGRect(x: newX, y: newY, width: width, height: height)
    }
    
    func addDefaultShadow()
    {
        addShadow(opacity: 0.3, radius: 10)
    }
    
    func addShadow(opacity: Float, radius: CGFloat)
    {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = radius
    }
}

protocol Roundable
{
    func set(position: CGPoint, edgeLength: CGFloat)
}

extension Roundable where Self: UIView
{
    func set(position: CGPoint, edgeLength: CGFloat) {
        let newFrame = CGRect(x: position.x, y: position.y, width: edgeLength, height: edgeLength)
        frame = newFrame
        layer.cornerRadius = edgeLength/2
    }
}
