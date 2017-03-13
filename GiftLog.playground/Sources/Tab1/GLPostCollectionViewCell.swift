import UIKit

class GLPostCollectionViewCell: UICollectionViewCell
{
    var imageView = RoundImageView()
    var backView: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = #colorLiteral(red: 0.862745098, green: 0.8431372549, blue: 0.7215686275, alpha: 1)
        return view
    }()
    
    var titleLabel: UILabel = UILabel()
    var dateLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backView)
        addSubview(imageView)
        
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        dateLabel.font = UIFont.preferredFont(forTextStyle: .caption2)
        backView.addSubview(titleLabel)
        backView.addSubview(dateLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bigHeight = frame.size.height
        imageView.set(position: CGPoint(x: 0, y:0), edgeLength: bigHeight)
        
        backView.anchorLeftInCenter(withLeftPadding: bigHeight/2, height: bigHeight - 20, rightPadding: 10)
        
        titleLabel.sizeToFit()
        titleLabel.anchorLeftInTop(withLeftPadding: bigHeight/2 + Padding.edgePadding.rawValue, topPadding: Padding.edgePadding.rawValue)
        
        dateLabel.sizeToFit()
        dateLabel.alignUnderMatchingLeft(titleLabel, topPadding: 4)
    }
}
