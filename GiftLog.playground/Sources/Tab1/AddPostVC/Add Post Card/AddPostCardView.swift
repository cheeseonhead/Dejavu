import UIKit


class AddPostCardView: UIView
{
    struct Style
    {
        static let cornerRadius: CGFloat = 10
        static let horizontalSpacing: CGFloat = 10
        static let verticalSpacing: CGFloat = Style.horizontalSpacing
        static let textFieldHeight: CGFloat = 30
        static let contentFieldMinHeight: CGFloat = 300
        static let imageSide: CGFloat = 100
        static let borderWidth: CGFloat = 1
    }
    
    var pickImageButton = PickImageButton()
    var titleField = UITextField()
    var contentField = UITextView()
    var timeLabel = UILabel()
    
    var time: Date
    
    required init()
    {
        time = Date()
        super.init(frame: CGRect.zero)
        
        setupSelf()
        setupPickImageButton()
        setupTitleField()
        setupContentField()
        setupTimeLabel()
        
        setupTemp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Functions
extension AddPostCardView
{
    func setupSelf()
    {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        layer.cornerRadius = Style.cornerRadius
        
        addDefaultShadow()
    }
    
    
    func setupPickImageButton()
    {
        pickImageButton.layer.cornerRadius = Style.cornerRadius
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
    
    func setupContentField()
    {
        let contentSectionLabel = UILabel(frame: CGRect.zero)
        contentSectionLabel.text = "Describe the Dejavu:"
        contentSectionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentSectionLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        addSubview(contentSectionLabel)
        
        contentField.translatesAutoresizingMaskIntoConstraints = false
        contentField.layer.cornerRadius = Style.cornerRadius
        contentField.layer.borderWidth = Style.borderWidth
        contentField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
        contentField.isScrollEnabled = false
        addSubview(contentField)
        
        let constraints = [
            NSLayoutConstraint(item: contentSectionLabel, attribute: .top, relatedBy: .equal, toItem: pickImageButton, attribute: .bottom, multiplier: 1.0, constant: Style.verticalSpacing),
            NSLayoutConstraint(item: contentSectionLabel, attribute: .left, relatedBy: .equal, toItem: pickImageButton, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: contentField, attribute: .top, relatedBy: .equal, toItem: contentSectionLabel, attribute: .bottom, multiplier: 1, constant: Style.verticalSpacing),
            NSLayoutConstraint(item: contentField, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Style.contentFieldMinHeight),
            NSLayoutConstraint(item: contentField, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: Style.horizontalSpacing),
            NSLayoutConstraint(item: contentField, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -Style.horizontalSpacing),
            NSLayoutConstraint(item: contentField, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -Style.verticalSpacing),
            ]
        
        addConstraints(constraints)
    }

    func setupTimeLabel()
    {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timeLabel)
        
        let constraints = [
            NSLayoutConstraint(item: timeLabel, attribute: .top, relatedBy: .equal, toItem: titleField, attribute: .bottom, multiplier: 1.0, constant: Style.verticalSpacing),
            NSLayoutConstraint(item: timeLabel, attribute: .left, relatedBy: .equal, toItem: titleField, attribute: .left, multiplier: 1.0, constant: 0)
        ]
        
        addConstraints(constraints)
    }
    
    func setupTemp()
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        
        timeLabel.text = formatter.string(from: time)
    }
}
