import UIKit

class BrownView: UIView
{
    required init()
    {
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor.brown
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
