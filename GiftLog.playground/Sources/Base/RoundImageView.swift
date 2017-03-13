import UIKit

class RoundImageView: UIImageView
{
    required init()
    {
        super.init(frame: CGRect.zero)
        contentMode = .scaleAspectFill
        layer.borderWidth = 0
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(position: CGPoint, edgeLength: CGFloat)
    {
        let newFrame = CGRect(x: position.x, y: position.y, width: edgeLength, height: edgeLength)
        frame = newFrame
        
        layer.cornerRadius = edgeLength/2
    }
}
