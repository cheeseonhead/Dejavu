import UIKit

class PickImageButton: UIButton
{
    required init() {
        super.init(frame: CGRect.zero)
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = UIColor.black
        backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)
        
        setImage(UIImage(named: ImageName.camera.rawValue), for: .normal)
        imageView?.contentMode = .scaleAspectFill
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
