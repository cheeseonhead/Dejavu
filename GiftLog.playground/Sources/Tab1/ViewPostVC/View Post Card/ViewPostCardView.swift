import UIKit

class ViewPostCardView: CardView
{
    var contentView = ViewPostCardContentView()
    
    required init() {
        super.init()
        
        setupContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContentView()
    {
        addSubview(contentView)
        
        let constraints = [
            NSLayoutConstraint(item: contentView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: contentView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: contentView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
        ]
        
        addConstraints(constraints)
    }
}

class ViewPostCardContentView: UIView
{
    var blurImage = BlurImage()
    
    required init() {
        super.init(frame: CGRect.zero)
        
        setupSelf()
        setupBlurImage()
        setupTemp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSelf()
    {
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 10
    }
    
    func setupBlurImage()
    {
        let maskView = UIView()
        maskView.translatesAutoresizingMaskIntoConstraints = false
        maskView.clipsToBounds = true
        addSubview(maskView)
        
        var constraints = [
            NSLayoutConstraint(item: maskView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: maskView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: maskView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: maskView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150)
        ]
        
        addConstraints(constraints)
        
        maskView.addSubview(blurImage)
        
        constraints = [
            NSLayoutConstraint(item: blurImage, attribute: .width, relatedBy: .equal, toItem: maskView, attribute: .width, multiplier: 2.0, constant: 0),
            NSLayoutConstraint(item: blurImage, attribute: .centerX, relatedBy: .equal, toItem: maskView, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: blurImage, attribute: .centerY, relatedBy: .equal, toItem: maskView, attribute: .centerY, multiplier: 1.0, constant: 0)
        ]
        
        maskView.addConstraints(constraints)
    }
    
    func setupTemp()
    {
        blurImage.image = UIImage(named: ImageName.winter.rawValue)
        addConstraint(NSLayoutConstraint(item: blurImage, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0))
    }
}

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
