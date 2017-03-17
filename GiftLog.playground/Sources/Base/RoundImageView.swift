import UIKit

class RoundImageView: UIView, Roundable
{
    var imageView = UIImageView()
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    required init()
    {
        super.init(frame: CGRect.zero)
        
        setupImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(position: CGPoint, edgeLength: CGFloat)
    {
        let newFrame = CGRect(x: position.x, y: position.y, width: edgeLength, height: edgeLength)
        frame = newFrame
        
        imageView.frame = CGRect(x: 0, y: 0, width: edgeLength, height: edgeLength)
        
        imageView.layer.cornerRadius = edgeLength/2
        layer.cornerRadius = edgeLength/2
    }
    
    func setupImageView()
    {
        addSubview(imageView)
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.clipsToBounds = true
    }
}
