import UIKit

class RoundView: UIView, Roundable
{
    required init()
    {
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
