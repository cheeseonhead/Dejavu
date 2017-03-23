import UIKit

class CardView: UIView
{
    fileprivate struct Style
    {
        static let cornerRadius: CGFloat = 10
    }
    
    required init()
    {
        super.init(frame: CGRect.zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = Style.cornerRadius
        
        // addDefaultShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
