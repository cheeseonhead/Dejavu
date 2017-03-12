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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = UIColor.red
        
        addSubview(backView)
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bigHeight = frame.size.height
        imageView.frame = CGRect(x: 0, y: 0, width: bigHeight, height: bigHeight)
        imageView.layer.cornerRadius = bigHeight/2
        
        backView.anchorLeftInCenter(withLeftPadding: bigHeight/2, height: bigHeight - 20, rightPadding: 10)
    }
}