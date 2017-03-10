import UIKit

class GLPostCollectionViewCell: UICollectionViewCell
{
    var imageView = RoundImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = UIColor.red
        
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = frame.size.height
        imageView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        imageView.layer.cornerRadius = size/2
    }
    
    func set(image: UIImage)
    {
        imageView.image = image
    }
}
