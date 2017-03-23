import UIKit

class GLPostCollectionViewCell: UICollectionViewCell
{
    let imageWidth: CGFloat = 30
    
    var imageView = RoundImageView()
    var shadowView = RoundView()
    var backView: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    var titleLabel = UILabel()
    var dateLabel = UILabel()
    var descriptionLabel = UILabel()
    var rightArrowView = UIImageView(image: UIImage(named: ImageName.rightInCircle.rawValue))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        addSubview(shadowView)
        shadowView.backgroundColor = UIColor.white
        shadowView.addShadow(opacity: 0.5, radius: 4)
        
        addSubview(backView)
        backView.layer.borderWidth = 1
        backView.layer.borderColor = #colorLiteral(red: 0.831372549, green: 0.831372549, blue: 0.831372549, alpha: 1).cgColor
        
        addSubview(imageView)
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        
        let referenceFont = UIFont.preferredFont(forTextStyle: .subheadline)
        descriptionLabel.font = UIFont(name: referenceFont.fontName, size: 12)
        descriptionLabel.numberOfLines = 4
        
        backView.addSubview(titleLabel)
        backView.addSubview(dateLabel)
        backView.addSubview(descriptionLabel)
        backView.addSubview(rightArrowView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bigHeight = frame.size.height
        imageView.set(position: CGPoint(x: 0, y:0), edgeLength: bigHeight)
        shadowView.set(position: CGPoint(x: 0, y: 0), edgeLength: bigHeight)
        
        backView.anchorLeftInCenter(withLeftPadding: bigHeight/2, height: bigHeight - 20, rightPadding: 10)
        
        rightArrowView.anchorRightInCenter(withRightPadding: 4, height: imageWidth, width: imageWidth)
        
        titleLabel.sizeToFit()
        titleLabel.anchorLeftInTop(withLeftPadding: bigHeight/2 + Padding.edgePadding.rawValue, topPadding: Padding.edgePadding.rawValue, fillingWidthWithRightPadding: 10)
        
        dateLabel.sizeToFit()
        dateLabel.alignUnderMatchingLeft(titleLabel, topPadding: 0)
        
        descriptionLabel.sizeToFit()
        descriptionLabel.alignUnderMatchingLeft(dateLabel, topPadding: 0, fillingHeightWithBottomPadding: Padding.edgePadding.rawValue, fillingWidthWithRightPadding: 2 + imageWidth)
    }
}
