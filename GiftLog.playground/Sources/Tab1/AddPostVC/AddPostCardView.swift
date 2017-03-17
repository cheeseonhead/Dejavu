import UIKit


class AddPostCardView: UIView
{
    struct Style
    {
        static let cornerRadius: CGFloat = 10
        
        static let imageSide: CGFloat = 100
    }
    
    var pickImageButton = UIButton()
    
    required init()
    {
        super.init(frame: CGRect.zero)
        
        setupSelf()
        setupPickImageButton()
        
        setupTemp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSelf()
    {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        layer.cornerRadius = Style.cornerRadius
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 10
    }
    
    
    func setupPickImageButton()
    {
        pickImageButton.setImage(UIImage(named:ImageName.dog.rawValue), for: .normal)
        addSubview(pickImageButton)
        pickImageButton.translatesAutoresizingMaskIntoConstraints = false
        pickImageButton.imageView?.contentMode = .scaleAspectFill
        
        
        let constraints = [
            NSLayoutConstraint(item: pickImageButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Style.imageSide),
            NSLayoutConstraint(item: pickImageButton, attribute: .width, relatedBy: .equal, toItem: pickImageButton, attribute: .height, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: pickImageButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 10),
            NSLayoutConstraint(item: pickImageButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
        ]
        
        addConstraints(constraints)
    }

    func setupTemp()
    {
        addConstraint(
            NSLayoutConstraint(item: pickImageButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -10))
    }
}
