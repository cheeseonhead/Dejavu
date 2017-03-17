import UIKit


class AddPostCardView: UIView
{
    struct Style
    {
        static let cornerRadius: CGFloat = 10
        static let horizontalSpacing: CGFloat = 10
        static let textFieldHeight: CGFloat = 30
        static let imageSide: CGFloat = 100
    }
    
    var pickImageButton = PickImageButton()
    var titleField = UITextField()
    
    required init()
    {
        super.init(frame: CGRect.zero)
        
        setupSelf()
        setupPickImageButton()
        setupTitleField()
        
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
        
        addDefaultShadow()
    }
    
    
    func setupPickImageButton()
    {
        addSubview(pickImageButton)
        
        let constraints = [
            NSLayoutConstraint(item: pickImageButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Style.imageSide),
            NSLayoutConstraint(item: pickImageButton, attribute: .width, relatedBy: .equal, toItem: pickImageButton, attribute: .height, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: pickImageButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 10),
            NSLayoutConstraint(item: pickImageButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10),
        ]
        
        addConstraints(constraints)
    }
    
    func setupTitleField()
    {
        titleField.borderStyle = .roundedRect
        titleField.placeholder = "Title"
        titleField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleField)
        
        let constraints = [
            NSLayoutConstraint(item: titleField, attribute: .left, relatedBy: .equal, toItem: pickImageButton, attribute: .right, multiplier: 1.0, constant: Style.horizontalSpacing),
            NSLayoutConstraint(item: titleField, attribute: .top, relatedBy: .equal, toItem: pickImageButton, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: titleField, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -Style.horizontalSpacing),
        ]
        
        addConstraints(constraints)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        print("\(#function) frame:\(subviews)")
    }
    
    func setupTemp()
    {
        addConstraint(
            NSLayoutConstraint(item: pickImageButton, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -10))
    }
}
