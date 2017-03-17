import UIKit

class PickImageButton: UIButton
{
    required init() {
        super.init(frame: CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        imageView?.contentMode = .scaleAspectFill
        tintColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
