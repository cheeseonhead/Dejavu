import UIKit

class BlurImage: UIView
{
    var imageView = UIImageView()
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        
        setupSelf()
        setupImageView()
        setupBlur()
    }
    
    func setupSelf()
    {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupBlur()
    {
        let darkBlur = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(blurView)
        
        let constraints = [
            NSLayoutConstraint(item: blurView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: blurView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: blurView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: blurView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
            ]
        
        addConstraints(constraints)
    }
    
    func setupImageView()
    {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        let constraints = [
            NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
            ]
        
        addConstraints(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
