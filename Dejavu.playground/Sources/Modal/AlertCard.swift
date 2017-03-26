import UIKit

class AlertCard: CardView
{
    fileprivate struct Style
    {
        static let blurImageHeight: CGFloat = 100
        static let thumbNailTopPadding: CGFloat = 20
        static let thumbNailSize: CGFloat = 100
        static let thumbToTitle: CGFloat = 10
        static let titleToDate: CGFloat = 5
        static let sectionSpacing: CGFloat = 10
        static let leftPadding: CGFloat = 20
        static let descToContent: CGFloat = 0
        static let headerFont: UIFont = UIFont.preferredFont(forTextStyle: .headline)
        static let headerColor: UIColor = AppStyle.TabBarTintColor
        static let mapHeight: CGFloat = 200
        static let latDelta: Double = 0.001
    }
    
    var post:Post
    
    var blurImage = BlurImage()
    var thumbNailView = ThumbNailView()
    var titleLabel = UILabel()
    var dateLabel = UILabel()
    
    required init(with post:Post)
    {
        self.post = post
        super.init()
        
        setupSelf()
        setupBlurImage()
        setupThumbNail()
        setupTitleLabel()
        setupDateLabel()
    }
    
    func setupSelf()
    {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
        
        blurImage.image = post.image
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
        thumbNailView.image = post.image
        addSubview(thumbNailView)
        
        let constraints = [
            NSLayoutConstraint(item: thumbNailView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: thumbNailView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: Style.thumbNailTopPadding),
            NSLayoutConstraint(item: thumbNailView, attribute: .width, relatedBy: .equal, toItem: thumbNailView, attribute: .height, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: thumbNailView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Style.thumbNailSize)
        ]
        
        addConstraints(constraints)
    }
    
    func setupTitleLabel()
    {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.text = post.title
        addSubview(titleLabel)
        
        let constraints = [
            NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbNailView, attribute: .bottom, multiplier: 1.0, constant: Style.thumbToTitle)
        ]
        
        addConstraints(constraints)
    }
    
    func setupDateLabel()
    {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        dateLabel.textColor = #colorLiteral(red: 0.6078431373, green: 0.6392156863, blue: 0.6745098039, alpha: 1)
        dateLabel.text = Post.dateFormatter.string(from: post.date)
        addSubview(dateLabel)
        
        let constraints = [
            NSLayoutConstraint(item: dateLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: dateLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: Style.titleToDate)
        ]
        
        addConstraints(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}
