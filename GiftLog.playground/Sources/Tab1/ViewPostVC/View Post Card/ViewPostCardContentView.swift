import UIKit

class ViewPostCardContentView: UIView
{
    fileprivate struct Style
    {
        static let blurImageHeight: CGFloat = 150
        static let thumbNailTopPadding: CGFloat = 20
        static let thumbNailSize: CGFloat = 200
    }
    
    var blurImage = BlurImage()
    var thumbNailView = ThumbNailView()
    
    required init() {
        super.init(frame: CGRect.zero)
        
        setupSelf()
        setupBlurImage()
        setupThumbNail()
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
            NSLayoutConstraint(item: maskView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Style.blurImageHeight)
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
    
    func setupThumbNail()
    {
        addSubview(thumbNailView)
        
        let constraints = [
            NSLayoutConstraint(item: thumbNailView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: thumbNailView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: Style.thumbNailTopPadding),
            NSLayoutConstraint(item: thumbNailView, attribute: .width, relatedBy: .equal, toItem: thumbNailView, attribute: .height, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: thumbNailView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Style.thumbNailSize)
        ]
        
        addConstraints(constraints)
    }
    
    func setupTemp()
    {
        addConstraint(NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1000))
        blurImage.image = UIImage(named: ImageName.winter.rawValue)
        thumbNailView.image = UIImage(named: ImageName.winter.rawValue)
    }
}

class ThumbNailView: UIView
{
    fileprivate struct Style
    {
        static let cornerRaius: CGFloat = 4
        static let imagePadding: CGFloat = 5
    }
    
    var imageView = UIImageView()
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    required init()
    {
        super.init(frame: CGRect.zero)
        
        setupSelf()
        setupImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSelf()
    {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = Style.cornerRaius
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func setupImageView()
    {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        let constraints = [
            NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: Style.imagePadding),
            NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -Style.imagePadding),
            NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: Style.imagePadding),
            NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -Style.imagePadding),
        ]
        
        addConstraints(constraints)
    }
}
