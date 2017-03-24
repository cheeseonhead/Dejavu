import UIKit

class GLPostCollectionViewCell: UICollectionViewCell
{
    struct Style
    {
        static let verticalPadding: CGFloat = 10
    }
    
//    var titleLabel = UILabel()
//    var dateLabel = UILabel()
//    var descriptionLabel = UILabel()
//    var rightArrowView = UIImageView(image: UIImage(named: ImageName.rightInCircle.rawValue))
    
    var thumbNail = ThumbNailView()
    var blurImage = BlurImage()
    
    var image: UIImage? {
        didSet {
            thumbNail.image = image
            blurImage.image = image
        }
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        setupSelf()
        setupBlurImage()
        setupThumbNail()
        setupTemp()
    }
    
    func setupSelf()
    {
        backgroundColor = UIColor.white
    }
    
    func setupBlurImage()
    {
        addSubview(blurImage)
        
        let constraints = [
            NSLayoutConstraint(item: blurImage, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: blurImage, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: blurImage, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
//            NSLayoutConstraint(item: blurImage, attribute: .height, relatedBy: .equal, toItem: blurImage, attribute: .width, multiplier: 1.0, constant: 0)
        ]
        
        addConstraints(constraints)
    }
    
    func setupThumbNail()
    {
        thumbNail.imageView.layer.cornerRadius = thumbNail.layer.cornerRadius
        addSubview(thumbNail)
        
        let constraints = [
            NSLayoutConstraint(item: thumbNail, attribute: .top, relatedBy: .equal, toItem: blurImage, attribute: .top, multiplier: 1.0, constant: Style.verticalPadding),
            NSLayoutConstraint(item: thumbNail, attribute: .bottom, relatedBy: .equal, toItem: blurImage, attribute: .bottom, multiplier: 1.0, constant: -Style.verticalPadding),
            NSLayoutConstraint(item: thumbNail, attribute: .left, relatedBy: .equal, toItem: blurImage, attribute: .left, multiplier: 1.0, constant: 20),
            NSLayoutConstraint(item: thumbNail, attribute: .height, relatedBy: .equal, toItem: thumbNail, attribute: .width, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: blurImage, attribute: .right, relatedBy: .equal, toItem: thumbNail, attribute: .right, multiplier: 1.0, constant: -20)
        ]
        
        addConstraints(constraints)
    }
    
    func setupTemp()
    {
//        thumbNail.image = UIImage(named: ImageName.dog.rawValue)
//        blurImage.image = UIImage(named: ImageName.dog.rawValue)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//let imageWidth: CGFloat = 30
//
//var imageView = RoundImageView()
//var backView: UIView = {
//    var view = UIView()
//    view.layer.cornerRadius = 5
//    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//    return view
//}()
//

//
//override init(frame: CGRect) {
//    super.init(frame: frame)
//    
//    addSubview(backView)
//    backView.layer.borderWidth = 1
//    backView.layer.borderColor = #colorLiteral(red: 0.831372549, green: 0.831372549, blue: 0.831372549, alpha: 1).cgColor
//    
//    addSubview(imageView)
//    
//    titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
//    dateLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
//    
//    let referenceFont = UIFont.preferredFont(forTextStyle: .subheadline)
//    descriptionLabel.font = UIFont(name: referenceFont.fontName, size: 12)
//    descriptionLabel.numberOfLines = 4
//    
//    backView.addSubview(titleLabel)
//    backView.addSubview(dateLabel)
//    backView.addSubview(descriptionLabel)
//    backView.addSubview(rightArrowView)
//}
//
//required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//}
//
//override func layoutSubviews() {
//    super.layoutSubviews()
//    
//    let bigHeight = frame.size.height
//    imageView.set(position: CGPoint(x: 0, y:0), edgeLength: bigHeight)
//    
//    backView.anchorLeftInCenter(withLeftPadding: bigHeight/2, height: bigHeight - 20, rightPadding: 10)
//    
//    rightArrowView.anchorRightInCenter(withRightPadding: 4, height: imageWidth, width: imageWidth)
//    
//    titleLabel.sizeToFit()
//    titleLabel.anchorLeftInTop(withLeftPadding: bigHeight/2 + Padding.edgePadding.rawValue, topPadding: Padding.edgePadding.rawValue, fillingWidthWithRightPadding: 10)
//    
//    dateLabel.sizeToFit()
//    dateLabel.alignUnderMatchingLeft(titleLabel, topPadding: 0)
//    
//    descriptionLabel.sizeToFit()
//    descriptionLabel.alignUnderMatchingLeft(dateLabel, topPadding: 0, fillingHeightWithBottomPadding: Padding.edgePadding.rawValue, fillingWidthWithRightPadding: 2 + imageWidth)
//}
